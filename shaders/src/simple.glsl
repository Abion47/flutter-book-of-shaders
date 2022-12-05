#version 450

layout(location = 0) uniform float a;

layout(location = 0) out vec4 fragColor;

void main() {
  fragColor = vec4(0.0, a, 0.0, 1.0);
}