import pandas as pd
import argparse

def main():
    parser = argparse.ArgumentParser(description="Filter out instructions from core.csv not found in spike.csv")
    parser.add_argument('--csv_file_1', required=True, help='Path to spike.csv file')
    parser.add_argument('--csv_file_2', required=True, help='Path to core.csv file')
    parser.add_argument('--csv_name_1', default='spike', help='Label for the spike file (used in messages)')
    parser.add_argument('--csv_name_2', default='core', help='Label for the core file (used in messages)')
    args = parser.parse_args()

    # Load the CSV files
    spike_df = pd.read_csv(args.csv_file_1)
    core_df = pd.read_csv(args.csv_file_2)

    # Extract the set of instruction strings from spike.csv
    spike_instr_set = set(spike_df['instr_str'].dropna().unique())

    # Identify rows in core.csv where instr_str is NOT in spike.csv
    mask = ~core_df['instr_str'].isin(spike_instr_set)
    removed_rows = core_df[mask]  # Rows to be removed (for debugging)
    filtered_core_df = core_df[~mask]  # Core with only matching instr_str

    # Show removed PCs for debugging
    print(f"Removed PCs from {args.csv_name_2}.csv (not found in {args.csv_name_1}.csv):")
    for pc in removed_rows['pc']:
        print(pc)

    # Save the filtered core.csv
    filtered_core_df.to_csv(f"{args.csv_name_2}", index=False)

if __name__ == "__main__":
    main()

