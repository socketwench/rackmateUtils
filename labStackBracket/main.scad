include <labstackBracket.scad>

Select = 0; //[0:preview,1:left,2:center,3:right,4:joiner]

if (Select == 0) {
    let(sideW=20+50+4.6/2, centerW=126.7-20+4.6/2,delta=sideW/2+centerW/2) {
        translate([-delta,0,0])
            color("green")
                labstackBracket_left();
        
        color("blue")
            labstackBracket_center();
        
        translate([delta,0,0])
            color("green")
                labstackBracket_right();
        
        translate([0,0,3.2]) {
            for (y=[0:-1:-1]) {
                translate([-centerW/2,y*80.2,0])
                    color("orange")
                        labstackBracket_joiner();
                
                translate([centerW/2,y*80.2,0])
                    mirror([1,0,0])
                        color("orange")
                            labstackBracket_joiner();
            }
        }
    }
}

else if (Select == 1) {
    labstackBracket_left();
}
else if (Select == 2) {
    labstackBracket_center();
}
else if (Select == 3) {
    labstackBracket_right();
}
else if (Select == 4) {
    translate([0,-40.1,0])
        labstackBracket_joiner();
}