include <BOSL2/std.scad>
include <BOSL2/walls.scad>
include <panels/panels.scad>
include <m3/m3.scad>


mirror([1,0,0])
union() {
    translate([-(257-162.3)/2,3,0])
        rotate([90,0,0])
            panels_1uEarLeft((257-162.3)/2);

    points = [
            [0,0],
            [162.3/2,0],
            [162.3/2,3],
            [37+7.4, 50+(7.4/2)],
            [37+(7.4/2), 50+7.4],
            [0,50+(7.4/2)]
        ];
        
    translate([0,0,7.85/2])
    //    linear_extrude(1) polygon(points);
        hex_panel(points, 1.5, 10, h = 7.85, frame = 6);

    translate([37+(7.4/2),50+(7.4/2),0])
    //    cylinder(h=1+4, d=7.4, $fn=25);
        cylinder(h=7.85+4, d=7.4, $fn=25);

    //translate([0,-1,0]) cube([162.3/2,1,2]);
    //translate([-1,-1,0]) cube([1,50+7.4/2+1,2]);



    translate([-1.5, (50+(7.4/2))/2, 44/2])
        rotate([0,90,0]) {
            difference() {
                hex_panel([44, 50+(7.4/2), 3], 1.5, 10, frame = 8);
        
                translate([44/-2+7.4/2, (50+(7.4/2))/2-(7.4/2), -1.5])        
                    m3BHCS_counterSinkCutout(height=3, countsinkHeight=0.2);
                
                
                translate([44/-2+7.4/2, (50+(7.4/2))/-2+7.4, -1.5])        
                    m3BHCS_counterSinkCutout(height=3, countsinkHeight=0.2);
            }
    }
}
/*
top_points = [
        [0,0],
        [162.3/2,0],
        [162.3/2,3],
        [7.85,50+(7.4/2)],
        [0,50+(7.4/2)]
    ];
    
//translate([0,0,44-7.85/2])
    difference() {
        hex_panel(top_points, 1.5, 10, h = 7.85, frame = 6);
        
        translate([0,7.4,0])
            rotate([0,90,0])
                m3x5x4_ThreadedInsert();

        translate([0,(50+(7.4/2))-(7.4/2),0])
            rotate([0,90,0])
                m3x5x4_ThreadedInsert();
    }
*/