#version 330 core
out vec4 FragColor;

in vec3 ourColor;
in vec2 TexCoord;

// texture samplers
uniform sampler2D texture1;
uniform sampler2D texture2;
uniform float mixValue;

void main()
{
	// linearly interpolate between both textures (80% container, 20% awesomeface)
	vec4 textureColor = mix(texture(texture1, TexCoord), texture(texture2, TexCoord), mixValue);
	FragColor = mix(vec4(ourColor, 1.0), textureColor, 0.8);
}