BEGIN {FS=" E" ; print ("; gcode modified for material mixing by 'Gcode Filament Mixer' from Gyrobot")}
{
#
# These lines are the mixing ratios, add extra Toolchanges or values here
#
		if ($0 == "T0")  {A = 1.0  ; B=0.0  ; C=0.0  ;print (";",$0,"A =",A*100"%","B =",B*100"%","C =",C*100"%") ; getline}
		if ($0 == "T1")  {A = 0.0  ; B=1.0  ; C=0.0  ;print (";",$0,"A =",A*100"%","B =",B*100"%","C =",C*100"%") ; getline}
		if ($0 == "T2")  {A = 0.0  ; B=0.0  ; C=1.0  ;print (";",$0,"A =",A*100"%","B =",B*100"%","C =",C*100"%") ; getline}
		if ($0 == "T3")  {A = 0.5  ; B=0.5  ; C=0.0  ;print (";",$0,"A =",A*100"%","B =",B*100"%","C =",C*100"%") ; getline}
		if ($0 == "T4")  {A = 0.5  ; B=0.0  ; C=0.5  ;print (";",$0,"A =",A*100"%","B =",B*100"%","C =",C*100"%") ; getline}
		if ($0 == "T5")  {A = 0.0  ; B=0.5  ; C=0.5  ;print (";",$0,"A =",A*100"%","B =",B*100"%","C =",C*100"%") ; getline}
		if ($0 == "T6")  {A = 0.3  ; B=0.3  ; C=0.4  ;print (";",$0,"A =",A*100"%","B =",B*100"%","C =",C*100"%") ; getline}
		if ($0 == "T7")  {A = 0.5  ; B=0.25 ; C=0.25 ;print (";",$0,"A =",A*100"%","B =",B*100"%","C =",C*100"%") ; getline}
		if ($0 == "T8")  {A = 0.25 ; B=0.5  ; C=0.25 ;print (";",$0,"A =",A*100"%","B =",B*100"%","C =",C*100"%") ; getline}
		if ($0 == "T9")  {A = 0.25 ; B=0.25 ; C=0.5  ;print (";",$0,"A =",A*100"%","B =",B*100"%","C =",C*100"%") ; getline}
		if ($0 == "T10") {A = 0.0  ; B=0.0  ; C=0.0  ;print (";",$0,"A =",A*100"%","B =",B*100"%","C =",C*100"%") ; getline}

	if (NF > 1)

	{

#
# Edit the "E" and "U" and "V" in quotes to output gcode with other commands, e.g. "A", "B" or "C" for Sailfish,"A", ":" and ":" for RepRap Pro firmware
#
		print ($1,"E"A*$2,"U"B*$2,"V"C*$2)
	}

	else

	{
		print($0)
	}

}