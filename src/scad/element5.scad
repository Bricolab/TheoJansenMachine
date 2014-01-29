include <settings.scad>;

gap = width/2.5;
axisScale = 0.95;	// To lower the size of the axis.
gapScale = 0.7;

module axis2(t,w)  { cylinder(h=t, r=w/2, center=false); }

module click(t,w) { cylinder(h=t, r1=w/1.7, r2=w/2, center=false); }
//module click(t,w) { translate([0,0,t/4]) { scale([1,1,0.7]) { sphere(r=w/1.7, $fn=res); } } }

module axe(t,w,m,gap)   {
	translate([0, w, t/2]) {
		rotate(a=90, v=[1,0,0]) {
			linear_extrude(w*2) {
				polygon(points=[[0,0], [-gap/1.9,t*m+2*t], [gap/1.9,t*m+2*t]]);
			}
		}
	}
}

module element5(t,w,g,m) {
	difference() {
		union() {
			loop(t,w);
			axis2(t*m+t*2,w*axisScale);
			translate([0,0,t*m+t]) { click(t,w*axisScale);}
		}
		// Option 1 a cube that open a square trench 
//		translate([-(g*gapScale)/2,-w*2,t+(t/5)]) {
//			cube(size=[g*gapScale,w*4,t*m*4]);
//		}
		// Option 2 an axe that open a triangular trench.
		axe(t,w,m,gap);
	}
}

translate([0,0,thick/2]) {
	translate([0, 7.5,0]) { element5(thick,width,gap,1); }
	translate([0, 2.5,0]) { element5(thick,width,gap,2); }
	translate([0,-2.5,0]) { element5(thick,width,gap,3); }
	translate([0,-7.5,0]) { element5(thick,width,gap,4); }
}
