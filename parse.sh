#!/bin/bash

filename="$1"

[ -f $filename ] || (echo "Fisierul $filename nu exista!" && exit 0)

echo "Se parseaza fisierul $filename:"
grep '^[d-]' $filename | awk '{
	perm=$1
	
	perm_afisare="Owner: "
	
	if(substr(perm, 2, 1)=="r"){
		perm_afisare = perm_afisare " citire,"}
	else {
		perm_afisare = perm_afisare " -,"}
	if(substr(perm, 3, 1)=="w"){
		perm_afisare = perm_afisare " scriere,"}
	else {
		perm_afisare = perm_afisare " -,"}
	if(substr(perm, 4, 1)=="x"){
		perm_afisare = perm_afisare " executie,"}
	else {
		perm_afisare = perm_afisare " -,"
	}
	perm_afisare = perm_afisare " Grup:"
	
	if(substr(perm, 5, 1)=="r"){
		perm_afisare = perm_afisare " citire,"}
	else {
		perm_afisare = perm_afisare " -,"}	
	if(substr(perm, 6, 1)=="w"){
		perm_afisare = perm_afisare " scriere,"}
	else {
		perm_afisare = perm_afisare " -,"}
	if(substr(perm, 7, 1)=="x"){
		perm_afisare = perm_afisare " executie,"}
	else {
		perm_afisare = perm_afisare " -,"}
	
	perm_afisare = perm_afisare " Others:"
	
	if(substr(perm, 8, 1)=="r"){
		perm_afisare = perm_afisare " citire,"}
	else {
		perm_afisare = perm_afisare " -,"}
	if(substr(perm, 9, 1)=="w"){
		perm_afisare = perm_afisare " scriere,"}
	else {
		perm_afisare = perm_afisare " -,"}
	if(substr(perm, 10, 1)=="x"){
		perm_afisare = perm_afisare " executie"}
	else {
		perm_afisare = perm_afisare " -"}
	
	owner=$3
	grup=$4
	dimensiune=$5
	dimensiune_finala=""
	
	if(dimensiune>=1024*1024*1024){
		dimensiune_finala = dimensiune/(1024*1024*1024) " Gb"}
	else if(dimensiune>=1024*1024){
		dimensiune_finala = dimensiune/(1024*1024) " Mb"}
	else if(dimensiune>=1024){
		dimensiune_finala = dimensiune/1024 " Kb"}
	else {
		dimensiune_finala = dimensiune " b"
	}
	
	luna=$6
	ziua=$7
	ora=$8
	nume=$9
	printf "Permisiuni: %s, Owner: %s, Grup: %s, Dimensiune: %s, Luna: %s, Ziua: %s, Ora: %s, Nume Fisier: %s\n\n", perm_afisare, owner, grup, dimensiune_finala, luna, ziua, ora, nume
}'
