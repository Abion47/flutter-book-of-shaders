#version 320 es
#pragma shader_stage(fragment)

#ifdef GL_ES
  precision highp float;
#endif

// Inputs
layout(location = 0) uniform float a;

// Output
layout(location = 0) out vec4 fragColor;

// Program
void main() {
  fragColor = vec4(0.0, a, 0.0, 1.0);
}