#!/bin/bash

filename="$1"

[ -f $filename ] || (echo "Fisierul $filename nu exista!" && exit 0)

cat "$filename" | awk '
BEGIN {
	procesare = 0
}

{
	if (index($0, "df") != 0) {
		procesare = 1
		getline
		getline
	}

	if (index($0, "exit") != 0 || index($0, "ls -l") != 0) {
		exit
	}
	
	if (procesare == 1){
		nume = $1
		dimensiune = $2
		used = $3
		liber = $4
		used_p = $5
		montat = $6
		
		
		dimensiune_finala = ""
	
		if(dimensiune >= 1024 * 1024 * 1024)
			dimensiune_finala = dimensiune/(1024 * 1024 * 1024) " Gb"
		else if(dimensiune >= 1024 * 1024)
			dimensiune_finala = dimensiune/(1024 * 1024) " Mb"
		else if(dimensiune >= 1024)
			dimensiune_finala = dimensiune/1024 " Kb"
		else 
			dimensiune_finala = dimensiune " b"
			
		used_final = ""
		
		if(used >= 1024 * 1024 * 1024)
			used_final = used/(1024 * 1024 * 1024) " Gb"
		else if(used >= 1024 * 1024)
			used_final = used/(1024 * 1024) " Mb"
		else if(used >= 1024)
			used_final = used/1024 " Kb"
		else 
			used_final = used " b"
			
		liber_final = ""
		
		if(liber >= 1024 * 1024 * 1024)
			liber_final = liber/(1024 * 1024 * 1024) " Gb"
		else if(liber >= 1024 * 1024)
			liber_final = liber/(1024 * 1024) " Mb"
		else if(liber >= 1024)
			liber_final = liber/1024 " Kb"
		else 
			liber_final = liber " b"
		
		printf "Nume: %s    Dimensiune: %s,   Utilizat: %s,   Liber: %s,   Utilizat(%): %s,   Montaj: %s\n\n\n", nume, dimensiune_finala, used_final, liber_final, used_p, montat
		
	}
	
	
}
	' $filename

exit 0
