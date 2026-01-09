#!/bin/bash

./colectare_date.sh

ultimul_typescript=$(ls -t date | head -n 1)

./parse.sh ./date/"$ultimul_typescript"

./parse_df.sh ./date/"$ultimul_typescript"

exit 0
