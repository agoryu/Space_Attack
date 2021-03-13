shader_type canvas_item;

uniform bool isActivated = true;

uniform float width = 450.0;
uniform float height = 600.0;

uniform float border = 100.0;

void fragment() {
	COLOR = vec4(1.0, 0.0, 0.0, 1.0);
	if (isActivated) {
		if (FRAGCOORD.x <= border) {
			COLOR = vec4(1.0, 0.0, 0.0, 1.0);
		} else if(FRAGCOORD.x >= width - border) {
			COLOR = vec4(1.0, 0.0, 0.0, 1.0);
		} else if (FRAGCOORD.y <= border) {
			COLOR = vec4(1.0, 0.0, 0.0, 1.0);
		} else if(FRAGCOORD.y >= height - border) {
			COLOR = vec4(1.0, 0.0, 0.0, 1.0);
		}
	}
}