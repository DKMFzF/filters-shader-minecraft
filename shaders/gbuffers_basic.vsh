#version 120

varying vec4 color;

uniform mat4 gbufferModelView;
uniform mat4 gbufferModelViewInverse;

uniform float frameTimeCounter;

void main() {

	vec4 position		= gbufferModelViewInverse * gl_ModelViewMatrix * gl_Vertex;
	
	#ifdef shakingCamera
		position.xy += vec2(0.01 * sin(frameTimeCounter * 2.0), 0.01 * cos(frameTimeCounter * 3.0));
	#endif

	gl_Position = gl_ProjectionMatrix * gbufferModelView * position;
	
	color = gl_Color;

}