// https://thebookofshaders.com/07/

#include <flutter/runtime_effect.glsl>

// Author @patriciogv - 2015
// http://patriciogonzalezvivo.com

#ifdef GL_ES
  precision mediump float;
#endif

// Constants
#define FLUTTER_Y_AXIS_SCALE -1 // Change to 1 for GLSL targets and -1 for Metal targets
#define PI 3.14159265359
#define TWO_PI 6.28318530718

// Input
uniform vec2 u_resolution;

// Output
out vec4 o_fragColor;

// Reference to
// http://thndl.com/square-shaped-shaders.html

void main(){
  vec2 st = FlutterFragCoord().xy / u_resolution;
  st.y = abs(min(FLUTTER_Y_AXIS_SCALE, 0.0)) 
         + (FLUTTER_Y_AXIS_SCALE * st.y); // Flip y axis for Metal targets

  st.x *= u_resolution.x / u_resolution.y;

  vec3 color = vec3(0.0);
  float d = 0.0;

  // Remap the space to -1. to 1.
  st = st * 2.0 - 1.0;

  // Number of sides of your shape
  int N = 3;

  // Angle and radius from the current pixel
  float a = atan(st.x,st.y) + PI;
  float r = TWO_PI / float(N);

  // Shaping function that modulate the distance
  d = cos(floor(0.5 + a / r) * r - a) * length(st);

  color = vec3(1.0 - smoothstep(0.4, 0.41, d));
  // color = vec3(d);

  o_fragColor = vec4(color, 1.0);
}