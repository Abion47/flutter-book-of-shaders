// https://thebookofshaders.com/05/

#include <flutter/runtime_effect.glsl>

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

// Input
uniform vec2 u_resolution;
uniform float u_time;

// Output
out vec4 o_fragColor;

// Plot a line on Y using a value between 0.0-1.0
float plot(vec2 st) {    
  return smoothstep(0.02, 0.0, abs(st.y - st.x));
}

// Main Program
void main() {
  vec2 st = fl_FragCoord(u_resolution) / u_resolution;
  float y = st.x;
  vec3 color = vec3(y);

  // Plot a line
  float pct = plot(st);
  color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

  o_fragColor = vec4(color, 1.0);
}