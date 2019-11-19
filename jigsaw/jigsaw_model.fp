varying highp vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;
varying mediump vec2 var_texcoord1;

uniform lowp sampler2D tex0;
uniform lowp sampler2D tex1;
uniform lowp vec4 tint;

float size = 0.015;

void main()
{
    vec4 color = texture2D(tex0, var_texcoord0.xy);
    vec4 mask = texture2D(tex1, var_texcoord1.xy);
    color = color * mask.w;

    //outline fx
    float a = -4.0 * mask.w;

    a += texture2D(tex1, var_texcoord1.xy + vec2(size, 0.0)).w;
    a += texture2D(tex1, var_texcoord1.xy + vec2(-size, 0.0)).w;
    a += texture2D(tex1, var_texcoord1.xy + vec2(0.0, size)).w;
    a += texture2D(tex1, var_texcoord1.xy + vec2(0.0, -size)).w;

    
   
    gl_FragColor = mix(color, vec4(.0,.0,.0, a), a);
    //gl_FragColor = mix(color, vec4(.0,.0, .0, mask.w), 1. - mask.w);
    //gl_FragColor = color;
}

