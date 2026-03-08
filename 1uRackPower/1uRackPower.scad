include <../BOSL2/std.scad>
include <../m3/m3.scad>
include <../iecInlet/iecInlet.scad>
include <../panels/panels.scad>

function 1uRackPower_bodyPoints(h=55) = [
    [0,0],
    [44,0],
    [44,h],
    
    [40,h],
    [40,h-1.6],
    [41.4,h-2],
    [41.4,h-4],
    [36,h-4],
    [36,h-11],
    [42,h-16],
    
    [42,16.6],
    [36.4,11.6],

    [36.4,2],
    
    [7.6,2],
    [7.6,11.6],
    [2,16.6],
    
    [2,h-16],
    [8,h-11],
    [8,h-4],
    [2.6,h-4],
    [2.6,h-2],
    [4,h-1.6],
    [4,h],
    [0,h],
];


module 1uRackPower_holePattern(h=55) {
    let(holeHeight=h-5) {
        translate([7.8/2,7/2+5,0])
            children();

        translate([44-7.8/2,7/2+5,0])
            children();

        translate([7.8/2,holeHeight-7/2,0])
            children();

        translate([44-7.8/2,holeHeight-7/2,0])
            children();
    }
}

module 1uRackPower_bodyExtruded(h=55) {
    difference() {
        linear_extrude(100)
            polygon(1uRackPower_bodyPoints(h));

        1uRackPower_holePattern(h)
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

module 1uRackPower_leftEar(h=55) {
    union() {
        panels_1uEarRight(57/2);

        difference() {
            linear_extrude(h)
                square([6,44]);
            
            translate([0,0,0])
                rotate([90,0,90])
                    1uRackPower_holePattern(h)
                            m3x5x4_ThreadedInsert();
        }
    }
}

module 1uRackPower_rightEar(h=55) {
    union() {
        panels_1uEarLeft(57/2);
        
        translate([57/2-6,0,0]) {
            difference() {
                linear_extrude(h)
                    square([6,44]);
            
                translate([0,0,0])
                    rotate([90,0,90])
                        1uRackPower_holePattern(h)
                            m3BHCS_counterSinkCutout(6, 4);

            }
        }
    }
}

module 1uRackPower_bodyBlank(h=55) {
    difference() {
        translate([-100/2,-44/2,0])
            rotate([90,0,90])
                1uRackPower_bodyExtruded(h);

        translate([0,0,2])
            cuboid([86,40,h-8], rounding=7, anchor=BOTTOM);
    }
}

module 1uRackPower_bodyIecInlet(h=55) {
    difference() {
        1uRackPower_bodyBlank(h);
        
        translate([-10,0,0])
            rotate([0,0,-90])
                linear_extrude(2)
                    iecInletCutoutShape();
        
        translate([-10,0,1.4])
            rotate([0,0,-90])
                linear_extrude(2-1.4)
                    offset(delta=1)
                        iecInletCutoutShape();
    }
}
