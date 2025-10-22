include <panels/panels.scad>
include <rectangles/rectangles.scad>
include <keystone/keystone.scad>

Select = 0; // [0:psuBrickEar, 1:fitTest, 2:psuBrickEarWithCutout]
EarType = 1; // [1:1U, 2:2U]

// Settings for the Netgate 2100 PSU brick
PsuWidth=44;
PsuHeight=33;
PsuDepth=107;
boxThickness=3;
boxDepth=15;
boxFrame=5;

CutoutDelta=5;

AddKeystone=0; // [0:No, 1:Yes]

/**
// Settings for a TP-Link SG1005P PSU brick
PsuWidth=60;
PsuHeight=38;
PsuDepth=107;
boxThickness=3;
boxDepth=15;
boxFrame=5;
**/

module psuBrickEar_uOutline(outerX, outerY, delta) {
    let(innerX=outerX-delta, innerY=outerY-delta) {
        polygon([
            [0,0],
            [0,outerY],
            [outerX,outerY],
            [outerX,outerY-(outerY-innerY)],
            [outerX-innerX,outerY-(outerY-innerY)],
            [outerX-innerX,(outerY-innerY)],
            [outerX,(outerY-innerY)],
            [outerX,0]
        ]);
    }
}

module psuBrickEar() {
    let (earHeight = 44*EarType) {
        difference() {
            union() {
                translate([(257-(PsuDepth-boxDepth*2))/2-boxDepth,(earHeight-PsuHeight-boxThickness*2)/2,PsuWidth+boxThickness*2])
                    rotate([0,90,0])
                        union() {
                            translate([0,0,-boxThickness])
                            linear_extrude(boxThickness)
                                rectFrame(PsuWidth+boxThickness*2,PsuHeight+boxThickness*2,boxFrame);
                                
                            linear_extrude(boxDepth)
                                psuBrickEar_uOutline(PsuWidth+boxThickness*2,PsuHeight+boxThickness*2,boxThickness);
                        }
                
                if (EarType == 1) {
                    panels_1uEarLeft((257-(PsuDepth-boxDepth*2))/2);
                }
                else if (EarType == 2) {
                    panels_2uEarLeft((257-(PsuDepth-boxDepth*2))/2);
                }
                
                if (AddKeystone == 1) {
                    translate([(257-(PsuDepth-boxDepth*2))/4,earHeight/2,0])
                        linear_extrude(9.5)
                            centeredRoundedRect(23.4,32.8,3);
                }
            }
            
            if (AddKeystone == 1) {
                translate([(257-(PsuDepth-boxDepth*2))/4,earHeight/2,0])
                    keystoneCutout(center=true);
            }
        }
    }
}

module psuBrickEar_withCutout() {
    let (earX=(257-(PsuDepth-boxDepth*2))/2, earY = 44*EarType, cutoutX=boxDepth-CutoutDelta, cutoutY=PsuHeight-CutoutDelta) {
        difference() {
            psuBrickEar();
            
            translate([earX-cutoutX, (earY-cutoutY)/2, 0])
            linear_extrude(3)
                square([cutoutX, cutoutY]);
        }
    }
}

module psuBrickEar_fitTest() {
    linear_extrude(1)
        union() {
            psuBrickEar_uOutline(PsuWidth+boxThickness*2,PsuHeight+boxThickness*2,boxThickness);
            
            translate([PsuWidth+boxThickness*2-3,0,0])
                square([3, PsuHeight+boxThickness*2]);
        }
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
