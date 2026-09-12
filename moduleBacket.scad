include <../BOSL2/std.scad>
include <../BOSL2/screws.scad>
include <labStackModules/labstack_moduleBlank.scad>
include <panels/panels.scad>

module labstackBracket_moduleHole() {
    translate([50/2,88/2,-0.01]) union(){
            labstack_moduleHolePattern()
                screw_hole("M3", head="none", length=1.01, $fn=20, anchor=BOTTOM)
                    attach(TOP)
                        cylinder(h=5, d=4.8, anchor=BOTTOM, $fn=20);

        cuboid([50,71,3.02], rounding=1, edges=[LEFT+FRONT, RIGHT+FRONT, LEFT+BACK, RIGHT+BACK], anchor=BOTTOM);
            
    }
}

module labstackBracket_bossPattern() {
    for (y = [-40.1:80.2:40.1]) {
        translate([0,y,0])
            children();
    }
}

module labstackBracket_boss() {
    diff()
        cylinder(h=6, d=4.8, anchor=BOTTOM, $fn=20)
            attach(TOP)
                tag("remove")
                    chamfer_cylinder_mask(d=4.8, chamfer=1);
}

module labstackBracket_bossPair() {
    translate([50/2,88/2,0]) 
        union(){
            labstackBracket_bossPattern()
                labstackBracket_boss();
        }
}

module labstackBracket_left() {
    union() {
        difference() {
            panels_2uEarLeft(w=20+50+4.6/2);
            
            translate([20,0,0])
                labstackBracket_moduleHole();
        }
        
        translate([20,0,0])
            labstackBracket_bossPair();
    }
}

module labstackBracket_right() {
    union() {
        difference() {
            panels_2uEarRight(w=20+50+4.6/2);
            
            translate([4.6/2,0,0])
                labstackBracket_moduleHole();
        }
                
        translate([4.6/2,0,0])
            labstackBracket_bossPair();
    }
}

module labstackBracket_center() {
    union() {
        difference() {
            cuboid([126.7-20+4.6/2,88,3], anchor=BOTTOM+LEFT+FRONT);
            
            translate([4.6/2,0,0])
                labstackBracket_moduleHole();
            
            translate([4.6/2+50+4.6,0,0])
                labstackBracket_moduleHole();
            
        }
                
        translate([4.6/2,0,0])
            labstackBracket_bossPair();
                
        translate([4.6/2+50+4.6,0,0])
            labstackBracket_bossPair();
    }
}

module labstackBracket_joinerLeft() {
    difference() {
        translate([5,0,0])
            diff()
                cuboid([126.7-20+4.6/2-5,(88-71)/2,3], anchor=BOTTOM+LEFT+FRONT, chamfer=0.4, edges=[TOP+LEFT,TOP+FRONT,TOP+BACK])
                    edge_mask(TOP+LEFT)
                        rounding_edge_mask(l=(88-71)/2, d=6, $fn=20);
               
        translate([50/2+4.6/2,88/2,0]) 
            labstackBracket_bossPattern()
                cylinder(h=3.01, d=5, anchor=BOTTOM, $fn=20);

        translate([50/2+4.6/2+50+4.6,88/2,0]) 
            labstackBracket_bossPattern()
                cylinder(h=3.01, d=5, anchor=BOTTOM, $fn=20);

        translate([50/2+4.6/2,88/2,0])
            labstack_moduleHolePattern()
                cylinder(h=5, d=4.8, anchor=BOTTOM, $fn=20);
        
        translate([50/2+4.6/2+50+4.6,88/2,0])
            labstack_moduleHolePattern()
                cylinder(h=5, d=4.8, anchor=BOTTOM, $fn=20);
    }
}

module labstackBracket_joinerRight() {
    mirror([1,0,0])
        labstackBracket_joinerLeft();
}

labstackBracket_center();