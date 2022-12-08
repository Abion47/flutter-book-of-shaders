// https://thebookofshaders.com/03/

#include <../fl-utility.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

// Input
uniform vec2 u_resolution;

// Output
out vec4 o_fragColor;

// Main Program
void main() {
  vec2 st = fl_FragCoord(u_resolution) / u_resolution;
  o_fragColor = vec4(st, 0.0, 1.0); // RGBA
}