shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture;
uniform sampler2D noise_texture: filter_nearest, repeat_enable;
uniform vec4 water_color: source_color;

uniform float distortion = 0.005;
uniform vec2 speed = vec2(0.5,0.2);
uniform float water_strength = 0.05;

// Called for every vertex the material is visible on.
void vertex() {
	//VERTEX.y += sin(TIME);
}

	// Called for every pixel the material is visible on.
void fragment() {
	vec2 noise = 2.0 * texture(noise_texture, UV + speed * TIME).rg - vec2(1.0);
	COLOR = texture(TEXTURE, UV + noise * water_strength);
	COLOR *= texture(screen_texture, SCREEN_UV + noise * distortion);
	COLOR = mix(water_color, COLOR, 0.6);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
