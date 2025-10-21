include <BOSL2/std.scad>
include <BOSL2/walls.scad>
include <panels/panels.scad>

wallHoleY = 46 + 3;
wallHoleY_fromRear = 51.8 + 3;

mirror([0,0,0])
union() {
    
    translate([-1.5,111.6/2,44/2])
        rotate([0,90,0])
            hex_panel([44, 111.6, 3], 1.5, 10, frame = 5);

    translate([26+7.6/2,wallHoleY_fromRear+7.6/2,0])
        cylinder(h=4, d=7.6, $fn=25);

    linear_extrude(2)    
        polygon([
            [0, 0],
            [7, 0],
            [7, 3],
            [26+7.6/2, wallHoleY_fromRear+7.6/2],
            [7, 108.6],
            [7, 111.6],
            [0, 111.6]
        ]);


    translate([-(257-160)/2,3,0])
        rotate([90,0,0])
            panels_1uEarLeft((257-160)/2);
            
    cube([7,2.8,44]);

    translate([0,108.8,0])
        cube([7,2.8,44]);
/*

    cube([7,2.8,5]);

    translate([0,108.8,0])
        cube([7,2.8,5]);

    translate([-3,0,0])
        cube([3,111.6,5]);
        */
}
