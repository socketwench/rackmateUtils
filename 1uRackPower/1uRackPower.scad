include <../BOSL2/std.scad>
include <../m3/m3.scad>
include <../iecInlet/iecInlet.scad>
include <../panels/panels.scad>

function 1uRackPower_bodyPoints() = [
    [0,0],
    [44,0],
    [44,51],
    
    [40,51],
    [40,49.4],
    [41.4,49],
    [41.4,47],
    [36,47],
    [36,40],
    [42,35],
    
    [42,16.6],
    [36.4,11.6],

    [36.4,2],
    
    [7.6,2],
    [7.6,11.6],
    [2,16.6],
    
    [2,35],
    [8,40],
    [8,47],
    [2.6,47],
    [2.6,49],
    [4,49.4],
    [4,51],
    [0,51],
];


module 1uRackPower_holePattern() {
    translate([7.8/2,7/2+5,0])
        children();

    translate([44-7.8/2,7/2+5,0])
        children();

    translate([7.8/2,46-7/2,0])
        children();

    translate([44-7.8/2,46-7/2,0])
        children();
}

module 1uRackPower_bodyExtruded() {
    difference() {
        linear_extrude(100)
            polygon(1uRackPower_bodyPoints());

        1uRackPower_holePattern()
            m3x5x4_ThreadedInsert();

        translate([0,0,100-20])
            1uRackPower_holePattern()
                    m3BHCS_counterSinkCutout(20, 17);
    }
}

module 1uRackPower_faceplateOutline() {
    square([100,38.5], center = true);
}

module 1uRackPower_faceplateBlank() {
    linear_extrude(1.8)
        1uRackPower_faceplateOutline();
}

module 1uRackPower_faceplateOutlet(count=3) {
    linear_extrude(1.8)
        difference() {
            1uRackPower_faceplateOutline();
            
            for(x = [-1:1:(count-2)]) {
                translate([x*30,0]){
                    translate([0,38.5/-22.6/-2])
                        square([24.6,22.6], center = true);
                }
            }
        }
}

module 1uRackPower_leftEar() {
    union() {
        panels_1uEarRight(57/2);

        difference() {
            linear_extrude(51)
                square([7,44]);
            
            translate([0,0,0])
                rotate([90,0,90])
                    1uRackPower_holePattern()
                            m3x5x4_ThreadedInsert();
        }
    }
}

module 1uRackPower_rightEar() {
    union() {
        panels_1uEarLeft(57/2);
        
        translate([57/2-7,0,0]) {
            difference() {
                linear_extrude(51)
                    square([7,44]);
            
                translate([0,0,0])
                    rotate([90,0,90])
                        1uRackPower_holePattern()
                            m3BHCS_counterSinkCutout(7, 4);

            }
        }
    }
}

module 1uRackPower_bodyBlank() {
    difference() {
        translate([-100/2,-44/2,0])
            rotate([90,0,90])
                1uRackPower_bodyExtruded();

        translate([0,0,2])
            cuboid([86,40,43], rounding=7, anchor=BOTTOM);
    }
}

module 1uRackPower_bodyIecInlet() {
    difference() {
        1uRackPower_bodyBlank();
        
        translate([-10,0,0])
            rotate([0,0,-90])
                linear_extrude(2)
                    iecInletCutoutShape();
    }
}
