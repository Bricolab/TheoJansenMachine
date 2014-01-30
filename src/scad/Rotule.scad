include <settings.scad>;
use <Joints.scad>;

module crankshaft1(radius=15.0, height=h, radius2=r2) {
	union() {
		difference() {
			union() {
				joint(height, r3);
				translate([0,-r3,0]) bar(radius, height, r3*2);
				translate([radius,0,0]) outer_joint(stick_count = 4, base = h);
			}
			joint_sqaxis(height=10, radius=radius2, delta_r=0);
		}

	}
}

module crankshaft2(radius=15.0, height=h, radius2=r2) {
	union() {
		difference() {
			union() {
				joint(height, r3);
				translate([0,-r3,0]) bar(radius, height, r3*2);
				translate([radius,0,0]) inner_joint(stick_count = 4, base = h);
			}
			joint_sqaxis(height=10, radius=radius2, delta_r=0);
		}

	}
}

module rotule1() { crankshaft1(); }
module rotule2() { crankshaft2(); }

at(0,1) crankshaft1();
at(0,-1) crankshaft2();