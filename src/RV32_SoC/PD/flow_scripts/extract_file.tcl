# Open the input timing report file and the output CSV file
set input_file "rv32i_soc.syn_final.timing.rpt"   ;# replace with the actual input file path
set output_file "timing_report.csv"
set file_id [open $output_file w]

# Write the header to the CSV file
puts $file_id "PathNumber,StartPoint,EndPoint,LaunchClock,CaptureClock,ClockSkew,CRPR,ClockUncertainty,RequiredTime,ArrivalTime,Slack,DataPathCellDelay,DataPathWireDelay"

# Open and read the input timing report file
set input_id [open $input_file r]
set report_data [read $input_id]
close $input_id

# Initialize variables to store extracted information
set path_number 1
set start_point ""
set end_point ""
set launch_clock ""
set capture_clock ""
set clock_skew 0
set crpr 0
set clock_uncertainty 0
set required_time 0
set arrival_time 0
set slack 0
set data_path_cell_delay 0
set data_path_wire_delay 0

# Regular expressions to extract the required data
set start_point_regex {Startpoint: (.*)}
set end_point_regex {Endpoint: (.*)}
set clock_uncertainty_regex {clock uncertainty\s+(-?\d+\.\d+)\s+(\d+\.\d+)}
set required_time_regex {data required time\s+(\d+\.\d+)}
set arrival_time_regex {data arrival time\s+(-?\d+\.\d+)}
set slack_regex {slack \(VIOLATED\)\s+(-?\d+\.\d+)}
set data_path_cell_delay_regex {(\S+)\s+\(\S+\)\s+(\d+\.\d+)\s+(\d+\.\d+) r}

# Parse the report data using regular expressions
foreach line [split $report_data "\n"] {
    # Extract start point
    if {[regexp $start_point_regex $line match start]} {
        set start_point $start
    }
    # Extract end point
    if {[regexp $end_point_regex $line match end]} {
        set end_point $end
    }
    # Extract clock uncertainty
    if {[regexp $clock_uncertainty_regex $line match unc start]} {
        set clock_uncertainty $start
    }
    # Extract required time
    if {[regexp $required_time_regex $line match req_time]} {
        set required_time $req_time
    }
    # Extract arrival time
    if {[regexp $arrival_time_regex $line match arr_time]} {
        set arrival_time $arr_time
    }
    # Extract slack
    if {[regexp $slack_regex $line match slack_value]} {
        set slack $slack_value
    }
    # Extract data path cell delay and wire delay
    if {[regexp $data_path_cell_delay_regex $line match cell_name delay1 delay2]} {
        set data_path_cell_delay $delay1
        set data_path_wire_delay $delay2
    }

    # When all necessary values are collected, write the row to CSV
    if {![string equal $start_point ""]
        && ![string equal $end_point ""]
        && $required_time != 0
        && $arrival_time != 0
        && $slack != 0} {

        # Set PathNumber (for example, it increments after each path is processed)
        set path_number [expr $path_number + 1]

        # Write the CSV row
        set csv_row "$path_number,$start_point,$end_point,$launch_clock,$capture_clock,$clock_skew,$crpr,$clock_uncertainty,$required_time,$arrival_time,$slack,$data_path_cell_delay,$data_path_wire_delay"
        puts $file_id $csv_row

        # Reset variables for next path
        set start_point ""
        set end_point ""
        set launch_clock ""
        set capture_clock ""
        set clock_skew 0
        set crpr 0
        set clock_uncertainty 0
        set required_time 0
        set arrival_time 0
        set slack 0
        set data_path_cell_delay 0
        set data_path_wire_delay 0
    }
}

# Close the output CSV file
close $file_id

# Print message indicating completion
puts "Timing report has been written to $output_file"
