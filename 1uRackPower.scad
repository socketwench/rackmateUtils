include <rectangles/rectangles.scad>
include <m3/m3.scad>
include <panels/panels.scad>
include <iecInlet/iecInlet.scad>

module squarePattern(width, height) {
    translate([width/-2, height/-2]) children();
    translate([width/2, height/-2]) children();
    translate([width/-2, height/2]) children();
    translate([width/2, height/2]) children();
}

module 1uRackPower_case() {
    difference() {    
        linear_extrude(55)
            union() {
                difference() {
                    square([100,44], center = true);
                    
                    difference() {
                        square([100-12,44-5], center = true);
                                        
                        squarePattern(92,36)
                            circle(d=7.4, $fn=20);
                    }
                    
                    squarePattern(92,36)
                        circle(d=4.8, $fn=20);
                }
            }
        
        translate([0,0,55])
            cube([98.4,42.4,2], center=true);
        
        translate([100/-2,0,0])
            1uRackPower_threadedSideCutout();
            
        translate([100/2,0,0])    
            1uRackPower_screwSideCutout();
    }
}

module 1uRackPower_faceplateOutline() {
    square([100,44], center = true);
}

module 1uRackPower_outletFaceplate() {
    linear_extrude(1.8)
        difference() {
            1uRackPower_faceplateOutline();
            
            for(x = [-1:1:1]) {
                translate([x*30,0]){
                    translate([0,(44-5-13)/2])
                        square([19.8,13], center = true);

                    translate([0,(44-5-22.6)/-2])
                        square([24.6,22.6], center = true);
                }
            }
        }
}

module 1uRackPower_inletFaceplate() {
    linear_extrude(1.8)
        difference() {
            1uRackPower_faceplateOutline();
            
            translate([30,0]){
                translate([0,(44-5-13)/2])
                    square([19.8,13], center = true);

                translate([0,(44-5-22.6)/-2])
                    square([24.6,22.6], center = true);
            }
            
            translate([(-30)/2,0])
                rotate([0,0,-90])
                    iecInletCutoutShape();
        }
}

module 1uRackPower_threadedSideCutout() {
    translate([0,0,44/2+(12/2)])
        rotate([90,0,90])
            union() {
                squarePattern(44-22, 55-12) 
                    m3x5x4_ThreadedInsert();
                
                translate([0,10,0])
                    cylinder(h=6, d=15, $fn=20);
            }
}

module 1uRackPower_screwSideCutout() {
    translate([-6,0,44/2+(12/2)])
        rotate([90,0,90])
            union() {
                squarePattern(44-22, 55-12) 
                    m3FHCS_counterSinkCutout(6);
                
                translate([0,10,0])
                    cylinder(h=6, d=15, $fn=20);
            }
}

module 1uRackPower_earTab() {
    rotate([90,0,90])
        translate([0,0,6/-2])
            linear_extrude(6)
                hull() {
                squarePattern(44-22, 55-12)
                    circle(d=8, $fn=20);

                polygon([
                    [44/-2, 55/-2],
                    [44/2, 55/-2],
                    [44/2, 55/-2+3],
                    [(44-22)/2, (55-12)/2],
                    [(44-22)/-2, (55-12)/2],
                    [44/-2, 55/-2+3],
                ]);
            }
}

module 1uRackPower_leftEar() {
    difference() {
        union() {
        translate([(257-200)/-2,44/-2,0])
            panels_1uEarLeft((257-200)/2);

        translate([6/-2,0,55/2])
                1uRackPower_earTab();
        }
                
        translate([-6,0,55/2])
            rotate([90,0,90])
                squarePattern(44-22, 55-12) 
                    m3FHCS_counterSinkCutout(6, 6);
    }
}

module 1uRackPower_rightEar() { 
    difference() {
        union() {
            translate([0,44/-2,0])
                panels_1uEarRight((257-200)/2);

            translate([6/2,0,55/2])
                1uRackPower_earTab();
        }
                
        translate([0,0,55/2])
            rotate([90,0,90])
                squarePattern(44-22, 55-12)
                    m3x5x4_ThreadedInsert();
    }
}

module 1uRackPower_outletFront() {
    union() {
        1uRackPower_case();
        1uRackPower_outletFaceplate();
    }
}


module 1uRackPower_inletFront() {
    union() {
        1uRackPower_case();
        1uRackPower_inletFaceplate();
    }
}

module 1uRackPower_back() {
    difference() {
        union() {
            translate([0,0,3/2])
                cube([98,42,3], center=true);
                
            translate([0,0,2/2])
                cube([100,44,2], center=true);
        }
        
        squarePattern(92,36)
            m3FHCS_counterSinkCutout(3);
    }
}

module 1uRackPower_preview() {
    translate([-100-.4,0,0])
        1uRackPower_leftEar();

    translate([100/-2-.2,0,0])
        1uRackPower_inletFront();
    
    translate([100/-2-.2,0,65])
        mirror([0,0,1])
            1uRackPower_back();

    translate([100/2+.2,0,0])
        1uRackPower_outletFront();
    
    translate([100/2+.2,0,65])
        mirror([0,0,1])
            1uRackPower_back();
    
    translate([100+.4,0,0])
        1uRackPower_rightEar();
}

1uRackPower_preview();
