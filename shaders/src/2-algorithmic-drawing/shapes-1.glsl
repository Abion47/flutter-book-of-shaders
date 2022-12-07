// https://thebookofshaders.com/07/

// Author @patriciogv - 2015
// http://patriciogonzalezvivo.com

#include <flutter/runtime_effect.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

// Constants
#define FLUTTER_Y_AXIS_SCALE -1 // Change to 1 for GLSL targets and -1 for Metal targets

// Input
uniform vec2 u_resolution;

// Output
out vec4 o_fragColor;

void main() {
  vec2 st = FlutterFragCoord().xy / u_resolution;
  st.y = abs(min(FLUTTER_Y_AXIS_SCALE, 0.0)) 
         + (FLUTTER_Y_AXIS_SCALE * st.y); // Flip y axis for Metal targets

  vec3 color = vec3(0.0);

  // bottom-left
  vec2 bl = step(vec2(0.1), st);
  float pct = bl.x * bl.y;

  // top-right
  // vec2 tr = step(vec2(0.1), 1.0 - st);
  // pct *= tr.x * tr.y;

  color = vec3(pct);

  o_fragColor = vec4(color, 1.0);
}