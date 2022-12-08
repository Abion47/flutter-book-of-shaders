// https://thebookofshaders.com/10/

// Author @patriciogv - 2015
// Title: Mosaic

#include <../fl-utility.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

// Input
uniform vec2 u_resolution;

// Output
out vec4 o_fragColor;

float random (vec2 st) {
  return fract(sin(dot(st.xy,
                       vec2(12.9898, 78.233)))
               * 43758.5453123);
}

void main() {
  vec2 st = fl_FragCoord(u_resolution) / u_resolution;

  st *= 10.0; // Scale the coordinate system by 10
  vec2 ipos = floor(st);  // get the integer coords
  vec2 fpos = fract(st);  // get the fractional coords

  // Assign a random value based on the integer coord
  vec3 color = vec3(random(ipos));

  // Uncomment to see the subdivided grid
  // color = vec3(fpos, 0.0);

  o_fragColor = vec4(color, 1.0);
}