include <settings.scad>

use <ArmBones.scad>
use <Spine.scad>
use <Scapula.scad>
use <Phalange.scad>
use <Rotule.scad>
use <Joints.scad>

translate([20, -50, 0]) {
	translate([0, 24,0]) radius();
	translate([0, 8,0])  ulna();
	translate([0,-8,0])  humerus();
	translate([0,-24,0]) clavicle();
}

translate([-80, -50, 0]) {
	translate([0, 24,0]) radius();
	translate([0, 8,0])  ulna();
	translate([0,-8,0])  humerus();
	translate([0,-24,0]) clavicle();
}

at(0,0.5) spine();
at(0,2) spine();

at(0,3.5) rotule1();
at(0,4.5) rotule2();

translate([0, -8, 0]) {
	outer_sqjoint(stick_count=4);

	for(x=[-1:-5]) { at(x,0) { strut(); } }
	rotate(a=90, v=[0,0,1]) {
		for(x=[-1:-4]) { at(x,0) { strut(); } }
	}

	at(1,0) outer_joint(stick_count=2);
	at(2,0) outer_joint(stick_count=2);
	at(3,0) outer_joint(stick_count=3);
	at(4,0) outer_joint(stick_count=4);
	at(5,0) outer_joint(stick_count=5);

	at(5,1) inner_joint(stick_count=2);
	at(5,2) inner_joint(stick_count=2);
	at(-5,1) inner_joint(stick_count=3);
	at(-5,2) inner_joint(stick_count=4);
	at(-5,3) inner_joint(stick_count=4);
	at(5,3) inner_joint(stick_count=5);
}

rotate(a=-90, v=[0,0,1]) {
	translate([-85, -60, 0]) {
		scapula();
	}
}

translate([-20, 65, 0]) {
	rotate(a=90, v=[0,0,1]) {
		scapula();
	}
}

translate([25, 45, 0]) {
	phalange();
}

rotate(a=180, v=[0,0,1]) {
	translate([-75,-110,0]) {
		phalange();
	}
}
