import os
import re
import pandas as pd
import sys

# ========================
# Configurable Parameters
# ========================
if len(sys.argv) != 2:
    print("Usage: python3 regression_summary.py <OUT_DIR>")
    sys.exit(1)

OUT_DIR = sys.argv[1]
SUMMARY_CSV = os.path.join(OUT_DIR, "regression_summary.csv")

# Match result line
result_pattern = re.compile(r"\[(PASSED|FAILED)\]:?\s*(\d+)?\s*(matched|mismatched)?", re.IGNORECASE)

summary = []

for test in os.listdir(OUT_DIR):
    test_path = os.path.join(OUT_DIR, test)
    if not os.path.isdir(test_path):
        continue

    for file in os.listdir(test_path):
        if file.startswith("diff_") and file.endswith(".log"):
            iteration = file.split("_")[1].split(".")[0]
            file_path = os.path.join(test_path, file)
            with open(file_path, 'r') as f:
                log = f.read()
                match = result_pattern.search(log)
                if match:
                    status = match.group(1).upper()
                    count = match.group(2) or "0"

                    summary.append({
                        "Test": test,
                        "Iteration": iteration,
                        "Status": status,
                        "Count": count,
                        "Log File": file
                    })
                else:
                    summary.append({
                        "Test": test,
                        "Iteration": iteration,
                        "Status": "UNKNOWN",
                        "Count": "N/A",
                        "Log File": file
                    })

# Save summary to CSV
df = pd.DataFrame(summary)
df.sort_values(by=["Test", "Iteration"], inplace=True)
df.to_csv(SUMMARY_CSV, index=False)

# Print summary table
print("\n📋 Regression Summary:\n")
print(df.to_string(index=False))

# Final verdict
if all(df["Status"] == "PASSED"):
    print("\n✅✅✅✅✅✅\n")
else:
    print("\n❌❌❌❌❌❌\n")
