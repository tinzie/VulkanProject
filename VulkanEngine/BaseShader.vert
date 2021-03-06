#version 450
#extension GL_ARB_seperate_shader_objects : enable

layout(location = 0)in vec3 inPosition;
layout(location = 1)in vec3 inColour;
layout(location = 2)in vec2 inTexCoord;

layout(location = 0)out vec3 fragColour;
layout(location = 1)out vec2 fragTexCoord;

layout(binding = 0) uniform UniformBufferObject {
	mat4 model;
	mat4 view;
	mat4 projection;
} ubo;

void main() {
	gl_Position = ubo.projection * ubo.view * ubo.model * vec4(inPosition, 1.0);
	fragColour = inColour;
	fragTexCoord = inTexCoord;
}