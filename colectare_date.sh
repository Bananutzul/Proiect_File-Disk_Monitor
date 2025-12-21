#!/bin/bash


moment=$(date +"%H-%M-%S")

echo "Incepe sesiunea $moment:"
script "date/sesiune_$moment.typescript"
exit 0
