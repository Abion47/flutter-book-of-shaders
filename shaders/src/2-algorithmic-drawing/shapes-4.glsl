// https://thebookofshaders.com/07/

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

  st.x *= u_resolution.x / u_resolution.y;

  vec3 color = vec3(0.0);
  float d = 0.0;

  // Remap the space to -1.0 to 1.0
  st = st * 2.0 - 1.0;

  // Make the distance field
  d = length(abs(st) - 0.3);
  // d = length(min(abs(st) - 0.3, 0.0));
  // d = length(max(abs(st) - 0.3, 0.0));

  // Visualize the distance field
  o_fragColor = vec4(vec3(fract(d * 10.0)), 1.0);

  // Drawing with the distance field
  // o_fragColor = vec4(vec3(step(0.3, d)), 1.0);
  // o_fragColor = vec4(vec3(step(0.3, d) * step(d, 0.4)), 1.0);
  // o_fragColor = vec4(vec3(smoothstep(0.3, 0.4, d) * smoothstep(0.6, 0.5, d)), 1.0);
}