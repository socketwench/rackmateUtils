include <panels/panels.scad>
include <rectangles/rectangles.scad>

Select = 0; // [0:psuBrickEar, 1:fitTest, 2:psuBrickEarWithCutout]
EarType = 1; // [1:1U, 2:2U]

// Settings for the Netgate 2100 PSU brick
PsuWidth=44;
PsuHeight=33;
PsuDepth=107;
boxThickness=3;
boxDepth=15;
boxFrame=5;

CutoutDelta=-5;

/**
// Settings for a TP-Link SG1005P PSU brick
PsuWidth=60;
PsuHeight=38;
PsuDepth=107;
boxThickness=3;
boxDepth=15;
boxFrame=5;
**/

module psuBrickEar() {
    let (earHeight = 44*EarType) {
        union() {
            translate([(257-(PsuDepth-boxDepth*2))/2-boxDepth,(earHeight-PsuHeight-boxThickness*2)/2,PsuWidth+boxThickness*2])
                rotate([0,90,0])
                    union() {
                        translate([0,0,-boxThickness])
                        linear_extrude(boxThickness)
                            rectFrame(PsuWidth+boxThickness*2,PsuHeight+boxThickness*2,boxFrame);
                            
                        linear_extrude(boxDepth)
                            rectFrame(PsuWidth+boxThickness*2,PsuHeight+boxThickness*2,boxThickness);
                    }
            
            if (EarType == 1) {
                panels_1uEarLeft((257-(PsuDepth-boxDepth*2))/2);
            }
            else if (EarType == 2) {
                panels_2uEarLeft((257-(PsuDepth-boxDepth*2))/2);
            }
        }
    }
}

module psuBrickEar_withCutout() {
    let (earHeight = 44*EarType) {
        union() {
            //psuBrickEar();
            
            offset(delta=CutoutDelta)
            square([boxDepth, PsuWidth]);
        }
    }
}

module psuBrickEar_fitTest() {
    linear_extrude(1)
        rectFrame(PsuWidth+boxThickness*2,PsuHeight+boxThickness*2,boxThickness);
}

if (Select == 0) {
    psuBrickEar();
}
else if (Select == 1) {
    psuBrickEar_fitTest();
}
else if (Select == 2) {
    psuBrickEar_withCutout();
}