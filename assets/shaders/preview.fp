varying highp vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;
varying mediump vec4 var_light;

uniform lowp sampler2D tex_base;
uniform lowp sampler2D tex_metallic_roughness;
uniform lowp sampler2D tex_normal;
uniform lowp sampler2D tex_occlusion;
uniform lowp sampler2D tex_emissive;

void main()
{
    vec4 sample_base = texture2D(tex_base, var_texcoord0.st);
    
    // Diffuse light calculations
    vec3 ambient_light = vec3(0.2);
    vec3 diff_light    = vec3(normalize(var_light.xyz - var_position.xyz));
    diff_light         = max(dot(var_normal,diff_light), 0.0) * sample_base.rgb + ambient_light;
    diff_light         = clamp(diff_light, 0.0, 1.0);

    gl_FragColor = vec4(diff_light,1.0);
}

