include <BOSL2/std.scad>
include <BOSL2/walls.scad>

boxWidth=113.6;
boxHeight=27.8;
boxDepth=88.6;

Select = 0; // [0:preview, 1:fitTest, 2:leftBody, 3:rightBody, 4:rightEar, 5:bodyFitTest]

module hexPoELite_wallStud(baseHeight) {
    let(height=3.8+baseHeight) {
        translate([22,44.4,height/2])
            cylinder(d=7.2, h=height, center=true, $fn=25);
    }
}

module hexPoELite_rubberFootHole() {
    cylinder(d=13, h=3.01, center=true, $fn=20);
}

module hexPoELite_rearFootPosition() {
    translate([13/2+5.8, boxDepth-4.6-13/2, 0])
        children();
}

module hexPoELite_frontFootPosition() {
    translate([13/2+4.2, 2.8+13/2, 0])
        children();
}

function hexPoELite_bottomPoints() = [
    [0,0],
    [boxWidth/2,0],
    [boxWidth/2,20],
    [22,44.4],
    [20,boxDepth],
    [0,boxDepth],
];

module hexPoELite_bottomPlate() {
    difference() {
        union() {
            hexPoELite_wallStud((44-boxHeight)/2);
            
            translate([0,0,(44-boxHeight)/4]) 
                hex_panel(hexPoELite_bottomPoints(), 1.5, 10, h = (44-boxHeight)/2, frame = 4);
            
            translate([0,0,(44-boxHeight)/4]) {
                hexPoELite_frontFootPosition()
                    cylinder(d=15, h=(44-boxHeight)/2, center=true, $fn=20);

                hexPoELite_rearFootPosition()
                    cylinder(d=15, h=(44-boxHeight)/2, center=true, $fn=20);
            }
        }

        translate([0,0,(44-boxHeight)/2-3/2]) { 
            hexPoELite_frontFootPosition()
                hexPoELite_rubberFootHole();

            hexPoELite_rearFootPosition()
                hexPoELite_rubberFootHole();
        }
    }
}

module hexPoELite_fitTest() {
    union() {
        hexPoELite_wallStud(1);

        translate([-1,0,0])
            cube([1,boxDepth,2]);

        linear_extrude(1) {
            difference() {
                polygon(hexPoELite_bottomPoints());
                
                hexPoELite_frontFootPosition()
                    circle(d=15, $fn=20);
                
                hexPoELite_rearFootPosition()
                    circle(d=15, $fn=20);
            }
        }

        translate([-1,boxDepth,0])
            cube([21,1,2]);
    }
}

module hexPoELite_preview() {
    hexPoELite_bottomPlate();
    
    translate([3/-2,boxDepth/2,44/2])
    rotate([0,90,0])
        hex_panel([44, boxDepth, 3], 1.5, 10, frame = (44-boxHeight)/2);
}

if (Select == 0) {
    hexPoELite_preview();
}
else if (Select == 1) {
    hexPoELite_fitTest();
}
else if (Select == 2) {
    
}
else if (Select == 3) {
    
}
else if (Select == 4) {
    
}