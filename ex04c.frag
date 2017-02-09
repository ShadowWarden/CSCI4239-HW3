//  Per-vertex Phong lighting
//  Fragment shader

uniform sampler2D tex;

void main()
{
   gl_FragColor = gl_Color * texture2D(tex,gl_TexCoord[0].xy);
}
