# Proiect\_File-Disk\_Monitori

Proiectul are ca scop monitorizarea fisierelor typescript generate de script-ul colectare\_date.sh si afisarea pe 
ecran, in limbaj omenesc, diferenta dintre comenzile lsi -l la momente diferite si evolutia spatiului pe disc, folosind
comanda df.

Script-ul monitor.sh apelaeaza pe rand colectare\_date.sh (care stocheaza fisierele typescript rezultate in folderul date,
parse.sh si parse\_df.sh (ultimele 2 avand fiecare ca argument ultimul fisier typescript generat.
