// https://thebookofshaders.com/06/

// Author @patriciogv - 2015
// http://patriciogonzalezvivo.com

#include <../fl-utility.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

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