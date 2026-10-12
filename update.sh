#!/usr/bin/env bash
#
# Refresh the files from planforecast.co.uk/data, where they are generated
# from the same queries the site's pages read.
#
# The site's CSVs end with a "# ..." line naming the source and licence. It is
# taken off here, because a CSV reader takes it for a row; the README and
# LICENSE say the same.
set -euo pipefail
cd "$(dirname "$0")"

fetch() {
  curl -fsS "https://planforecast.co.uk/data/$1" | grep -v '^#' > "data/$2.tmp"
  mv "data/$2.tmp" "data/$2"
}

fetch refusal-reasons.csv refusal-reasons.csv
fetch all.csv decisions.csv
wc -l data/*.csv
