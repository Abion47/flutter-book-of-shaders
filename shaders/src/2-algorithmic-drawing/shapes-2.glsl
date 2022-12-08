// https://thebookofshaders.com/06/

// Author @patriciogv - 2015
// http://patriciogonzalezvivo.com

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

// Constants
#define FLUTTER_Y_AXIS_SCALE -1 // Change to 1 for GLSL targets and -1 for Metal targets

// Input
uniform vec2 u_resolution;

// Output
out vec4 o_fragColor;

void main(){
  vec2 st = fl_FragCoord(u_resolution) / u_resolution;
  float pct = 0.0;

  // a. The DISTANCE from the pixel to the center
  pct = distance(st, vec2(0.5));

  // b. The LENGTH of the vector
  //    from the pixel to the center
  vec2 toCenter = vec2(0.5) - st;
  pct = length(toCenter);

  // c. The SQUARE ROOT of the vector
  //    from the pixel to the center
  vec2 tC = vec2(0.5) - st;
  pct = sqrt(tC.x * tC.x + tC.y * tC.y);

  vec3 color = vec3(pct);

  o_fragColor = vec4(color, 1.0);
}