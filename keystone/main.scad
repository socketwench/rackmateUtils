include <keystone.scad>

Select = 0; // [0:keystoneCutout, 1:keystonePort, 2:keystoneBlank]

Center = false;

if (Select==0) {
    keystoneCutout(center=Center);
} else if (Select==1) {
    keystonePort(center=Center);
} else if (Select==2) {
    keystoneBlank(center=Center);
}