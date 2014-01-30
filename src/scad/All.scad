include <settings.scad>

use <ArmBones.scad>
use <Spine.scad>
use <Scapula.scad>
use <Phalange.scad>
use <Rotule.scad>
use <Joints.scad>

// translate([0, -30, h/2]) {
// 	translate([0, 21,0]) radius();
// 	translate([0, 7,0])  ulna();
// 	translate([0,-7,0])  humerus();
// 	translate([0,-21,0]) clavicle();
// }

translate([0, 7, h/2]) {
	spine();
}

translate([0, 48, 0]) {
	rotule();
}

translate([0, -8, 0]) {
	outer_joint();
	at(1, 0) inner_joint();
	at(2, 0) outer_sqjoint();
}

// rotate(a=-90, v=[0,0,1]) {
// 	translate([-60, -60, h/2]) {
// 		scapula();
// 	}
// }

// translate([20, 20, h/2]) {
// 	phalange();
// }

// translate([0,80,(cos(45)*r2*2-0.35)/2]) {
// 	rotate(a=90, v=[0,1,0]) {
// 		joint_sqaxis(30);
// 	}
// }
