#!/bin/bash
INPUT=Kolesarjenje2017.csv
OLDIFS=$IFS
IFS=","
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read vrsta_dejavnosti Datum Naslov Razdalja Kalorije Cas Povprecni_srcni_utrip Najvisji_srcni_utrip Povprecna_hitrost Najvisja_hitrost Skupni_vzpon Skupni_spust Povprecni_tempo Najvisji_tempo skupno_stevilo_zamahov Najnizja_temperatura
do
	echo "==================================================="
	echo "Vrsta_dejavnosti : $vrsta_dejavnosti			  |"
	echo "Datum : $Datum				  |"
	echo "Naslov : $Naslov			  |"
	echo "Razdalja : $Razdalja-km				  |"
	echo "Kalorije : $Kalorije  				  |"
	echo "Cas : $Cas 					  |"
	echo "Povprecni_srcni_utrip : $Povprecni_srcni_utrip  		  	  |"
	echo "Najvisji_srcni_utrip : $Najvisji_srcni_utrip 			  |"
	echo "Povprecna_hitrost : $Povprecna_hitrost-km/h       		  |"
	echo "Najvisja_hitrost : $Najvisja_hitrost-km/h         		  |"
	echo "Skupni_vzpon : $Skupni_vzpon-m                    		  |"
	echo "Skupni_spust : $Skupni_spust-m                    		  |"  
	echo "Povprecni_tempo : $Povprecni_tempo                		  |"
	echo "Najvisji_tempo : $Najvisji_tempo                  		  |"
	echo "skupno_stevilo_zamahov : $skupno_stevilo_zamahov			  |"
	echo "Najnizja_temperatura : $Najnizja_temperatura°C    		 	  |"
	echo "==================================================="

done < $INPUT
IFS=$OLDIFS
echo "statistika za leto 2017:"
echo "skupno število km v letu 2017:"
awk -F "\"*,\"*" '{total+=$4} END {print total}' Kolesarjenje2017.csv
echo "povprečna hitrost v letu 2017:"
awk -F "\"*,\"*" '{sum+=$9/145} END {print sum}' Kolesarjenje2017.csv
echo "povprečje povprečnega pulza v letu 2017:"
awk -F "\"*,\"*" '{total+=$7/145} END {print total}' Kolesarjenje2017.csv
echo "povprečje maksimalnega pulza v letu 2017:"
awk -F "\"*,\"*" '{sum+=$8/145} END {print sum}' Kolesarjenje2017.csv
echo "skupni vzpon v letu 2017:"
awk -F "\"*,\"*" '{sum+=$11} END {print sum}' Kolesarjenje2017.csv
echo "skupni poraba kalorij v letu 2017:"
awk -F "\"*,\"*" '{sum+=$5} END {print sum}' Kolesarjenje2017.csv
echo "povprečna temperatura voženj v letu 2017:"
awk -F "\"*,\"*" '{sum+=$16/145} END {print sum}' Kolesarjenje2017.csv
echo "*******************************************"
echo "seminarska naloga pri VSPO	 	  *"
echo "Student: Patrick Drvaric		  *"
echo "Stevilka: 11150190283			  *"
echo "Mentor: Renato Lukac			  *"
echo "*******************************************"
