include <../BOSL2/std.scad>
include <../BOSL2/screws.scad>
include <../labStackModules/labstack_moduleBlank.scad>
include <../panels/panels.scad>

module labstackBracket_moduleInsertHoles() {
    labstack_moduleHolePattern()
        screw_hole("M3", head="none", length=1.01, $fn=20, anchor=BOTTOM)
            attach(TOP)
                cylinder(h=5, d=4.8, anchor=BOTTOM, $fn=20);
}

module labstackBracket_moduleHole() {
    translate([0,0,-0.01]) union(){
        labstackBracket_moduleInsertHoles();

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
    union(){
        labstackBracket_bossPattern()
            labstackBracket_boss();
    }
}

module labstackBracket_left() {
    let (w=20+50+4.6/2,delta=w/2-50/2-4.6/2)
        union() {
            difference() {
                panels_2uEarLeft(w=w, center=true);
                
                translate([delta,0,0])
                    labstackBracket_moduleHole();
            }
            
            translate([delta,0,0])
                labstackBracket_bossPair();
        }
}

module labstackBracket_right() {
    let (w=20+50+4.6/2,delta=w/2-50/2-4.6/2)
        union() {
            difference() {
                panels_2uEarRight(w=w, center=true);
                
                translate([-delta,0,0])
                    labstackBracket_moduleHole();
            }
                    
            translate([-delta,0,0])
                labstackBracket_bossPair();
        }
}

module labstackBracket_center() {
    union() {
        difference() {
            cuboid([126.7-20+4.6/2,88,3], anchor=BOTTOM);
            
            translate([-1*(50/2+4.6/2),0,0])
                labstackBracket_moduleHole();
            
            translate([50/2+4.6/2,0,0])
                labstackBracket_moduleHole();
            
        }
                
        translate([-1*(50/2+4.6/2),0,0])
            labstackBracket_bossPair();
                
        translate([50/2+4.6/2,0,0])
            labstackBracket_bossPair();
    }
}

module labstackBracket_joiner() {
    union() {
        difference() {
            translate([2.5-0.1,40.1,0])
                diff()
                    cuboid([126.7-20+4.6/2-2.5*2-0.1,7.6,3], anchor=BOTTOM, chamfer=0.4, edges=[TOP+LEFT,TOP+FRONT,TOP+BACK])
                        edge_mask(TOP+LEFT)
                            rounding_edge_mask(l=(88-71)/2, d=6, $fn=20);
            
            for (i=[-1:2:1]) {
                translate([i*(50/2+4.6/2),0,0])
                    labstack_moduleHolePattern()
                        cylinder(h=5, d=4.8, anchor=BOTTOM, $fn=20);

                translate([i*(50/2+4.6/2),0,0])
                    labstackBracket_bossPattern()
                        cylinder(h=3.01, d=5, anchor=BOTTOM, $fn=20);
                
            }
        }
    }
}
