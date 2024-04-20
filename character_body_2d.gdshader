shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
//uniform sampler2D distortionTexture;

void fragment() {
	vec4 pixelColor = texture(TEXTURE, UV);
	//COLOR = screenColor;
	//COLOR = pixelColor;
	//COLOR.rgb = COLOR.gbr;
	//COLOR = screenColor;
}

void vertex() {
	VERTEX.y += sin(TIME + VERTEX.y + VERTEX.x) * 5.0;
}