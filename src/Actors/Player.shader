shader_type canvas_item;

uniform float energy = 0.0;

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	if (color.r <= 0.1 && color.g <= 0.1 && color.b <= 0.1 && color.a >= 0.8) {
		COLOR = vec4(hsv2rgb(vec3(energy/2.0, 0.8, 0.95)), 1.0);
	} else {
		COLOR = color;
	}
}