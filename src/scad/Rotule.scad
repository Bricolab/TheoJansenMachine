include <settings.scad>;

module rotule(radius=15.0, height=h, radius2=r2) {
	difference() {
		linear_extrude(height=height) {
			circle(radius + radius2*2);
		}
		joint_sqaxis(height=10, radius=radius2, delta_r=0);
		translate([radius, 0, 0]) joint_axis(height, radius2);
	}
}

rotule();