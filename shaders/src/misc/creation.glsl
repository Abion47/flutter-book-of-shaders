// https://www.shadertoy.com/view/XsXXDn

// http://www.pouet.net/prod.php?which=57245
// If you intend to reuse this shader, please add credits to 'Danilo Guanabara'

#include <flutter/runtime_effect.glsl>

#ifdef GL_ES
  precision mediump float;
#endif

// Input
uniform vec2 u_resolution;
uniform float u_time;

// Output
out vec4 o_fragColor;

// Main Program
void main(){
  vec3 c;
  float l,z=u_time;
  for(int i=0;i<3;i++) {
    vec2 uv,p=FlutterFragCoord().xy/u_resolution;
    uv=p;
    p-=.5;
    p.x*=u_resolution.x/u_resolution.y;
    z+=.07;
    l=length(p);
    uv+=p/l*(sin(z)+1.)*abs(sin(l*9.-z-z));
    c[i]=.01/length(mod(uv,1.)-.5);
  }
  o_fragColor=vec4(c/l,u_time);
}