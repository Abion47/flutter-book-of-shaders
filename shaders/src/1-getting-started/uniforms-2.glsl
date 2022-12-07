// https://thebookofshaders.com/03/

#include <flutter/runtime_effect.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

// Input
uniform vec2 u_resolution;

// Output
out vec4 o_fragColor;

// Main Program
void main() {
  vec2 st = FlutterFragCoord().xy / u_resolution;
  o_fragColor = vec4(st, 0.0, 1.0); // RGBA
}