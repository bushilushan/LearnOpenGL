#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;

out VS_OUT {
    vec3 normal;
} vs_out;

uniform mat4 view;
uniform mat4 model;

void main()
{
    mat3 normalMatrix = mat3(transpose(inverse(view * model)));
    vs_out.normal = vec3(vec4(normalMatrix * aNormal, 0.0));
    // 几何着色器接受的位置向量是观察空间坐标，所以这里我们只将法向量左乘了model和view矩阵
    gl_Position = view * model * vec4(aPos, 1.0); 
}