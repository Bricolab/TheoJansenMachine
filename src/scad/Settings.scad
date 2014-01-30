// -- Parameters --------------------------

$fn = 32;

// radius of the hole in the outer joint
r1 = 2;

// radius of the hole in the piece
r2 = 4.5;

// radius of the base of joints and width of sticks
r3 = 6.5;

// height of sticks and thickness of pieces.
h = 2;

// height of the base of the joints
h_base = 1;


// -- Base elements ----------------------

module joint(height=h, radius=r3) {
	cylinder(h=height, r=radius, center=true);
}

module joint_axis(height=h, radius=r2) {
	cylinder(h=height*10, r=radius, center=true);
}

module joint_sqaxis(height=h, radius=r2, delta_r=0.35) {
 	side = cos(45) * (radius * 2) - delta_r;
 	cube([side, side, height], center=true);
}

module bar(length, height=h, width=r3) { cube(size=[length, width, height], center=true); }

// -- Utility ------------------------------

module at(x, y) {
	translate((2 * r3 + 3) * [x, y, 0]) child(); 
}

module atPoints2(p0, p1) {
	translate(p0) { child(); }
	translate(p1) { child(); }
}

module atPoints3(p0, p1, p2) {
	translate(p0) { child(); }
	translate(p1) { child(); }
	translate(p2) { child(); }
}

module atEnd(length) { atPoints2([length/2, 0, 0], [-length/2, 0, 0]) child(); }