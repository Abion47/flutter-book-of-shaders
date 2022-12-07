// https://thebookofshaders.com/08/

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

// YUV to RGB matrix
mat3 yuv2rgb = mat3(1.0, 0.0, 1.13983,
                    1.0, -0.39465, -0.58060,
                    1.0, 2.03211, 0.0);

// RGB to YUV matrix
mat3 rgb2yuv = mat3(0.2126, 0.7152, 0.0722,
                    -0.09991, -0.33609, 0.43600,
                    0.615, -0.5586, -0.05639);

void main() {
  vec2 st = FlutterFragCoord().xy / u_resolution;
  st.y = abs(min(FLUTTER_Y_AXIS_SCALE, 0.0)) 
         + (FLUTTER_Y_AXIS_SCALE * st.y); // Flip y axis for Metal targets
         
  vec3 color = vec3(0.0);

  // UV values goes from -1 to 1
  // So we need to remap st (0.0 to 1.0)
  st -= 0.5;  // becomes -0.5 to 0.5
  st *= 2.0;  // becomes -1.0 to 1.0

  // we pass st as the y & z values of
  // a three dimensional vector to be
  // properly multiply by a 3x3 matrix
  color = yuv2rgb * vec3(0.5, st.x, st.y);

  o_fragColor = vec4(color, 1.0);
}