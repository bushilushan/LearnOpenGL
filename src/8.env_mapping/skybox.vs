#version 330 core
layout (location = 0) in vec3 aPos;

out vec3 TexCoords;

uniform mat4 projection;
uniform mat4 view;

void main()
{
    TexCoords = aPos;
    vec4 pos = projection * view * vec4(aPos, 1.0);
    // 这样设置，可以使skybox的深度始终为1.0（最大值），在深度测试时skybox一定在所有物体的后面
    gl_Position = pos.xyww;
}