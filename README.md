##GCODE FILAMENT MIXER

A script to post process 3D printing GCODE files to enable multiple extruders to be used simultaneously for multi-material mixing.

##Background

Currently, standard 3D printing Gcode files contain tool change commands (T1,T2,T3 etc) to activate another extruder. This switches off the current extruder and all the extruder Gcode (E) commands that follow in the file will now apply to the newly activated extruder. It's a one or the other scenario.

Proposals in the open source 3D printing community for multi-material models require on-the-fly mixing capabilities where multiple feedstocks are introduced into a combined single hot-end. The rate at which the feedstocks are introduced will determine the characteristics of the material being extruded. Examples are one flexible and one rigid input feedstock to output a range of flexible materials depending on the mix ratio. Discrete areas of a model can be printed with different percentages of flexibilities. Another application is producing a vast range of coloured extrusion by mixing CMYK input feedstocks.

To enable a complete solution will require collaboration between many disciplines in the 3D Printing community: slicing software, Gcode standards, firmware programmers, printer electronics and machine builders.

This script sits somewhere between the slicing software and the firmware. Once the slicing software developers make a successful plug-in that outputs Gcode in a format conducive for filament mixing, I guess the script will then be redundant.

##What This Script Does.

It takes a standard Gcode file that is currently produced for multiple extrusion (dual etc.) and searches for the extruder change "T" codes. Once found, it replace the respective "E" values with a recalculated "A" and "B" value based upon the mix percentages required. NOTE: "A" and "B" are just labels for the purpose of this write-up, the actual labels in the Gcode could be anything defined by a proposed change to the standards.

##Workflow

1. Split the stl model up into various parts, each reflecting a specific mix ratio of feedstock.
1. Run current slicing software for multi-extrusion. I use Slic3r which outputs specific extruder change Gcodes "T1" "T2" etc for each area of the model (see video).
1. Run the "Gcode Filament Mixer" that will search for the extruder change "T" codes. Once found, replace the respective "E" values with a recalculated "A" and "B" value based upon the mix percentages required.
1. Run Gcode through a modified firmware that can use A and B values (or similar Codes) to drive independent extruders. I believe Sailfish can use A and B values `G1 X100 Y100 A10 B20` and Aprinter firmware uses E and U `G1 X100 Y100 E10 U20`

It is easy for me to change the script to mix more than two extruders (for full range colour mixing) and output different extruder codes. J.Corbett proposed A,B,C,D,J and K etc for the Gcodes in his paper on [Colour Mixing (Page 29)](http://reprap.org/mediawiki/images/0/05/RepRapColourMixingReport-jmc.pdf). However A,B and C are already used for X,Y,Z rotational axes resp.

I have currently set 10 mix ratios, more can easily be added. Please remember this was to create different flexibilities where there are only two input filaments (flexible and non flexible)

##Instructions

I have created a video (silent) that shows you the Slicing and Gcode mixing process :

[Gcode Filament Mixer - YouTube](http://youtu.be/sCfRjaHYPZ8)

In the nawk folder, you can edit the `nawkfile.nawk` in a text editor to edit mixing values or to add extra toolchanges.

**Windows**

I have included the unix command `nawk` in the nawk folder, downloaded from [http://gnuwin32.sourceforge.net/packages/nawk.htm](http://gnuwin32.sourceforge.net/packages/nawk.htm)

1. Place gcode file to convert in this root folder and name it : `input.gcode`
1. Run Execute.bat and it should convert gcode and create a `output.gcode` file


**Linux**

1. Place gcode file to convert in this root folder and name it : `input.gcode`
1. nawk is already a linux command so you can simply just execute from this root folder :

	`nawk -f nawk/nawkfile.nawk input.gcode > output.gcode`

##Final Note

Long term, I expect slicing software to be able to output multiple extruder Gcode values on the same line, and firmware / hardware capable of driving multiple extruder's simultaneously independent!!!

I am happy to work with anyone who wishes to take this further.
