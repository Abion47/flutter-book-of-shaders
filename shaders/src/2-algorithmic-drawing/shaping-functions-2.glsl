// https://thebookofshaders.com/05/

#include <flutter/runtime_effect.glsl>

// Author: Inigo Quiles
// Title: Expo

#ifdef GL_ES
  precision mediump float;
#endif

/**
* Automatic metal y-axis conversion
* */
#ifndef FLUTTER_Y_AXIS_SCALE
#define FLUTTER_Y_AXIS_SCALE -1 // Change to 1 for GLSL targets and -1 for Metal targets
#endif

vec2 fl_FragCoord(vec2 resolution) {
  vec2 fragCoord = FlutterFragCoord().xy;

  #if FLUTTER_Y_AXIS_SCALE < 0
  fragCoord.y = resolution.y - fragCoord.y; // Flip y axis for Metal targets
  #endif

  return fragCoord;
}

// Constants
#define PI 3.14159265359

// Input
uniform vec2 u_resolution;
uniform float u_time;

// Output
out vec4 o_fragColor;

float plot(vec2 st, float pct) {
  return smoothstep(pct-0.02, pct     , st.y) -
         smoothstep(pct     , pct+0.02, st.y);
}

// Main Program
void main() {
  vec2 st = fl_FragCoord(u_resolution) / u_resolution;
  float y = pow(st.x, 5.0);
  vec3 color = vec3(y);

  // Plot a line
  float pct = plot(st, y);
  color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

  o_fragColor = vec4(color, 1.0);
}