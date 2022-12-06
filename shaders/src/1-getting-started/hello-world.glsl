// https://thebookofshaders.com/02/

#ifdef GL_ES
  precision mediump float;
#endif

// Input
uniform float u_time;

// Output
out vec4 o_fragColor;

// Main Program
void main() {
	o_fragColor = vec4(1.0, 0.0, 1.0, 1.0); // RGBA
}