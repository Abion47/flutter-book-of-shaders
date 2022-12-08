// https://thebookofshaders.com/07/

#include <flutter/runtime_effect.glsl>

// Author @patriciogv - 2015
// http://patriciogonzalezvivo.com

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

// Output
out vec4 o_fragColor;

void main(){
  vec2 st = fl_FragCoord(u_resolution) / u_resolution;
  vec3 color = vec3(0.0);

  vec2 pos = vec2(0.5) - st;

  float r = length(pos) * 2.0;
  float a = atan(pos.y, pos.x);

  float f = cos(a * 3.0);
  // f = abs(cos(a * 3.0));
  // f = abs(cos(a * 2.5)) * 0.5 + 0.3;
  // f = abs(cos(a * 12.0) * sin(a * 3.0)) * 0.8 + 0.1;
  // f = smoothstep(-0.5, 1.0, cos(a * 10.0)) * 0.2 + 0.5;

  color = vec3(1.0 - smoothstep(f, f + 0.02, r));

  o_fragColor = vec4(color, 1.0);
}