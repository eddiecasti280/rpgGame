shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform sampler2D distortionTexture;

void fragment() {
	//vec2 distortedUV = SCREEN_UV + texture(distortionTexture, UV).r * 0.05;
	//vec4 screenColor = texture(SCREEN_TEXTURE, distortedUV);
	//COLOR = screenColor;
	
	//vec4 pixelColor = texture(SCREEN_TEXTURE, distortedUV);
	//COLOR = pixelColor;
	//COLOR.rgb = COLOR.gbr;
	//COLOR = screenColor;
}