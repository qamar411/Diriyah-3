set cells_to_create [join "
iovdd_left
iovdd_right
iovdd_bottom
iovdd_top
"]
foreach c $cells_to_create {
	create_cell $c [get_lib_cells */PVDD2DGZ]
}

set cells_to_create [join "
iovss_left
iovss_right
iovss_bottom
iovss_top
"]
foreach c $cells_to_create {
	create_cell $c [get_lib_cells */PVSS2DGZ]
}

set cells_to_create [join "
vdd_left1
vdd_right1
vdd_bottom1
vdd_top1
vdd_left2
vdd_right2
vdd_bottom2
vdd_top2
"]
foreach c $cells_to_create {
	create_cell $c [get_lib_cells */PVDD1DGZ]
}


set cells_to_create [join "
vss_left1
vss_right1
vss_bottom1
vss_top1
vss_left2
vss_right2
vss_bottom2
vss_top2
"]
foreach c $cells_to_create {
	create_cell $c [get_lib_cells */PVSS1DGZ]
}