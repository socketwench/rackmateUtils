include <../BOSL2/std.scad>
include <../BOSL2/walls.scad>
include <../panels/panels.scad>
include <../m3/m3.scad>
include <../rectangles/rectangles.scad>

/*
panels_1uEarLeft((257-170+4*2)/2, 3);
translate([(257-170+4*2)/2,0,0])
cube([4,44,15], anchor=RIGHT+FRONT+BOTTOM);
translate([(257-170+4*2)/2-4,0,3])
cube([7,44,37], anchor=RIGHT+FRONT+BOTTOM);
translate([20,44/2,3])
rotate([0,0,90])
wedge([7,20,37], anchor=BOTTOM+BACK);
*/

/*
panels_1uEarLeft((257-170+4*2)/2, 3);
translate([(257-170+4*2)/2,1,0])
cube([4,86,15], anchor=RIGHT+BOTTOM);
translate([(257-170+4*2)/2-4,1,0])
cube([7,86,40], anchor=RIGHT+BOTTOM);
translate([20,44/2,0])
rotate([0,0,90])
wedge([7,20,40], anchor=BOTTOM+BACK);
translate([(257-170+4*2)/2,0,0])
cube([30.4,42,2], anchor=RIGHT+BACK+BOTTOM);
*/

/*
difference() {
union() {
panels_1uEarLeft((257-170+11*2)/2, 3);
translate([(257-170+11*2)/2,0,0])
    cube([11,44,18+11], anchor=RIGHT+FRONT+BOTTOM);
translate([(257-170+11*2)/2-11,0,3])
    cube([7,44,37], anchor=RIGHT+FRONT+BOTTOM);
translate([20,44/2,3])
    rotate([0,0,90])
        wedge([7,20,37], anchor=BOTTOM+BACK);
}
translate([(257-170+11*2)/2,0,18+11])
    rotate([-90,0,0])
        cylinder(h=44, r=11, $fn=25);


translate([(257-170+11*2)/2,0,0])
rotate([0,0,90])
wedge([44,5,5], anchor=LEFT+BOTTOM+FRONT);
}
*/

/*
difference() {
union() {
panels_1uEarLeft((257-170+11*2)/2, 3);
translate([(257-170+11*2)/2,0,0])
    cube([11,86,18+11], anchor=RIGHT+FRONT+BOTTOM);
translate([(257-170+11*2)/2-11,0,0])
    cube([7,86,40], anchor=RIGHT+FRONT+BOTTOM);
translate([20,44/2,3])
    rotate([0,0,90])
        wedge([7,20,37], anchor=BOTTOM+BACK);
    
translate([(257-170+4*2)/2,44,0])
cube([30.4,42,2], anchor=RIGHT+FRONT+BOTTOM);
}
translate([(257-170+11*2)/2,0,18+11])
    rotate([-90,0,0])
        cylinder(h=86, r=11, $fn=25);


translate([(257-170+11*2)/2,0,0])
rotate([0,0,90])
wedge([86,5,5], anchor=LEFT+BOTTOM+FRONT);
}
*/

/*
difference() {
    union() {
        panels_1uEarLeft((257-100)/2, 3);
        
        translate([(257-170)/2,0,0])
            cube([(257-100)/2-(257-170)/2,14,15], anchor=LEFT+FRONT+BOTTOM);

        translate([(257-170)/2-7,0,0])
            cube([(257-100)/2-(257-170)/2+7,14+7,40], anchor=LEFT+FRONT+BOTTOM);
        
        translate([20,21/2,3])
            rotate([0,0,90])
                wedge([7,20,37], anchor=BOTTOM+BACK);
        
        translate([(257-100)/2,21,0])
            cube([7,44-14-7,40], anchor=RIGHT+FRONT+BOTTOM);
    }
    
    translate([(257-170)/2+4,0,0])
        cube([(257-100)/2-(257-170)/2-4,14-4,15], anchor=LEFT+FRONT+BOTTOM);

    translate([(257-170)/2,0,15])
        cube([(257-100)/2-(257-170)/2,14,40-15], anchor=LEFT+FRONT+BOTTOM);

    translate([(257-100)/2-7,26,8])
        rotate([0,90,0])
            m3BHCS_counterSinkCutout(7, 0.2);
    
    translate([(257-100)/2-7,26,44-8])
        rotate([0,90,0])
            m3BHCS_counterSinkCutout(7, 0.2);

    translate([(257-100)/2-7,44-4,8])
        rotate([0,90,0])
            m3BHCS_counterSinkCutout(7, 0.2);
    
    translate([(257-100)/2-7,44-4,40-4])
        rotate([0,90,0])
            m3BHCS_counterSinkCutout(7, 0.2);
 
    difference() {
        
        difference() {
        translate([28.5,0,0])
            cube([(257-100)/2-28.5,44,0.4], anchor=LEFT+FRONT+BOTTOM);

        translate([(257-170)/2+4-5,0,0])
                cube([(257-100)/2-(257-170)/2-4+5,14-4+5,15], anchor=LEFT+FRONT+BOTTOM);

        }
        
        translate([28.5,0,0])
        hex_panel([(257-100)/2-28.5, 44, 0.4], 1.5, 10, frame = 5, anchor=LEFT+FRONT+BOTTOM);
    } 
}
*/

/*
difference() {
    hex_panel([100, 34, 0.4], 1.5, 10, frame = 5, anchor=LEFT+FRONT+BOTTOM) {
        attach(TOP)
            cube([100,34,3-0.4], anchor=BOTTOM) {
                align(TOP, LEFT+BACK)
                    cube([7,30,37], anchor=LEFT+BOTTOM+BACK);
                align(TOP, RIGHT+BACK)
                    cube([7,30,37], anchor=LEFT+BOTTOM+BACK);
                align(TOP, FRONT)
                    cube([100,4,12], anchor=LEFT+BOTTOM+FRONT)
                        align(BACK,BOTTOM)
                            cube([100,7,37], anchor=LEFT+BOTTOM+FRONT);
            }
    }
    
    translate([100/2,0,3])
    cuboid([25,20.4,37.01], rounding=2, edges=[LEFT+RIGHT+BOTTOM,LEFT+BACK,RIGHT+BACK], anchor=BOTTOM, $fn=15);

    translate([0,16,8])
        rotate([0,90,0])
            m3x5x4_ThreadedInsert();
    
    translate([0,16,44-8])
        rotate([0,90,0])
            m3x5x4_ThreadedInsert();

    translate([0,34-4,8])
        rotate([0,90,0])
            m3x5x4_ThreadedInsert();
    
    translate([0,34-4,40-4])
        rotate([0,90,0])
            m3x5x4_ThreadedInsert();
    
    translate([95,16,8])
        rotate([0,90,0])
            m3x5x4_ThreadedInsert();
    
    translate([95,16,44-8])
        rotate([0,90,0])
            m3x5x4_ThreadedInsert();

    translate([95,34-4,8])
        rotate([0,90,0])
            m3x5x4_ThreadedInsert();
    
    translate([95,34-4,40-4])
        rotate([0,90,0])
            m3x5x4_ThreadedInsert();
}
*/


/*
difference() {
union() {
panels_1uEarLeft((257-100+11*2)/2, 3);
translate([(257-170+11*2)/2,0,0])
    cube([11,44,18+11], anchor=RIGHT+FRONT+BOTTOM);
translate([(257-170+11*2)/2-11,0,3])
    cube([7,44,37], anchor=RIGHT+FRONT+BOTTOM);
translate([20,44/2,3])
    rotate([0,0,90])
        wedge([7,20,37], anchor=BOTTOM+BACK);
}
translate([(257-170+11*2)/2,0,18+11])
    rotate([-90,0,0])
        cylinder(h=14, r=11, $fn=25);


translate([(257-100+11*2)/2+5,0,0])
    cuboid([(257-100+11*2)/2-(257-170+11*2)/2+10,10+10,10], chamfer=5, anchor=RIGHT);
}
*/
difference() {
    union() {
        panels_1uEarLeft((257-100)/2, 3);

        translate([(257-100)/2,0,3])
            cube([(257-170)/2,14+7,37], anchor=RIGHT+FRONT+BOTTOM);
    }
    
    translate([(257-100+11*2)/2+5,0,0])
    union()
        cuboid([(257-100+11*2)/2-(257-170+11*2)/2+10,10+10*2,10], chamfer=5, anchor=RIGHT)
        cuboid([(257-100+11*2)/2-(257-170+11*2)/2,10*2,18], anchor=BOTTOM)
        align(TOP,RIGHT)
            cuboid([(257-100+11*2)/2-(257-170+11*2)/2+11,14*2,22], rounding=11, edges=[LEFT+BOTTOM], anchor=BOTTOM);
}

