include <1uRackPower.scad>

Select = 0; //[0:preview, 1:bodyBlank, 2:bodyIecInet, 3:leftEar, 4:rightEar, 5:faceplateBlank, 6:faceplate1Outlet, 7:faceplate3Outlets]
    
Height=55;
    
if (Select == 0) {
    1uRackPower_bodyIecInlet(Height);

    translate([0,0,55-3.9])
        1uRackPower_faceplateOutlet(1);

    translate([50.2,44/-2,0])
        1uRackPower_leftEar(Height);

    translate([-78.6,44/-2,0])
        1uRackPower_rightEar(Height);
} else if (Select == 1) {
    1uRackPower_bodyBlank(Height);
} else if (Select == 2) {
    1uRackPower_bodyIecInlet(Height);
} else if (Select == 3) {
    1uRackPower_leftEar(Height);
} else if (Select == 4) {
    1uRackPower_rightEar(Height);
} else if (Select == 5) {
    1uRackPower_faceplateBlank(Height);
} else if (Select == 6) {
    1uRackPower_faceplateOutlet(1);
} else if (Select == 7) {
    1uRackPower_faceplateOutlet(3);
}
