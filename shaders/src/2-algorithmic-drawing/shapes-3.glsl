// https://thebookofshaders.com/07/

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

// Input
uniform vec2 u_resolution;

// Output
out vec4 o_fragColor;

float circle(in vec2 _st, in float _radius) {
  vec2 dist = _st - vec2(0.5);
  return 1.0 - smoothstep(_radius - (_radius * 0.01),
                          _radius + (_radius * 0.01),
                          dot(dist, dist) * 4.0);
}

void main() {
  vec2 st = fl_FragCoord(u_resolution) / u_resolution;
  vec3 color = vec3(circle(st, 0.9));

  o_fragColor = vec4(color, 1.0);
}