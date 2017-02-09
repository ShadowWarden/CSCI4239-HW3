//  Per-vertex Blinn-Phong lighting (inline)
//  Vertex shader

void main()
{
   //  P is the vertex coordinate on body
   vec3 P = vec3(gl_ModelViewMatrix * gl_Vertex);
   //  N is the object normal at P
   vec3 N = normalize(gl_NormalMatrix * gl_Normal);
   //  Light Position for light 0
   vec3 LightPos = vec3(gl_LightSource[0].position);
   //  L is the light vector
   vec3 L = normalize(LightPos - P);

   //  Emission and ambient color
   gl_FrontColor = gl_FrontMaterial.emission + gl_FrontLightProduct[0].ambient + gl_LightModel.ambient*gl_FrontMaterial.ambient;

   //  Diffuse light intensity is cosine of light and normal vectors
   float Id = dot(L,N);
   if (Id>0.0)
   {
      //  Add diffuse
      gl_FrontColor += Id*gl_FrontLightProduct[0].diffuse;
      //  Specular is cosine of half and normal vectors
      float Is = dot(N,gl_LightSource[0].halfVector.xyz);
      if (Is>0.0) gl_FrontColor += pow(Is,gl_FrontMaterial.shininess)*gl_FrontLightProduct[0].specular;
   }

   //  Texture coordinate
   gl_TexCoord[0] = gl_MultiTexCoord0;

   //  Return fixed transform coordinates for this vertex
   gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
}
