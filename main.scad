include <BOSL2/std.scad>
include <BOSL2/walls.scad>
include <panels/panels.scad>

module netgate2100_mountingHole() {
    union() {
        translate([0,0,1])
            cylinder(h=2.65, d=6.6, $fn=20);
        
        cylinder(h=3.65, d=3.4, $fn=20);
    }
}

module netgate2100_mountingHolePattern() {
    translate([8.2,29,0]) {
        children();
        translate([0,50,0]) children();
    }
}


difference() {
    union() {
    netgate2100_mountingHolePattern()
        cylinder(h=3.65, d=8.2*2, $fn=25);

    linear_extrude(3.65)
        polygon([
            [8.2*2,0],
            [8.2*2,29],
            [2,(29+50/2)-21/2],
            [2,(29+50/2)+21/2],
            [8.2*2,79],
            [3,104],
            [0,104],
            [0,0]
        ]);
    }

    netgate2100_mountingHolePattern()
        netgate2100_mountingHole();
}


points = [
        [0,0],
        [0,104],
        [-3.65,104],
        [-44,3],
        [-44,0]
    ];

translate([-1.5,0,0])
    rotate([0,90,0])
        hex_panel(points, 1.5, 10, h = 3, frame = 5);

translate([-(257-172)/2,3,0])
    rotate([90,0,0])
        panels_1uEarLeft((257-172)/2);
