HW 3 : GLSL Performance : Omkar H. Ramachandran

I've used the shaders on Example 4 on different objects (Cube, Teapot, Sphere) and tried benchmarking FPS under different conditions/setups. 

To compile, just run 
$ qmake hw3.pro
$ make

And then to run, use
$ ./hw3

Performance Results :
(The following results were benchmarked using the Sphere object with light set to animate on three different rigs)

1. My laptop under NVIDIA 820M
Shader Mode :         FPS
Stored :              6029.8
Vertex Blinn :        5998.2
Vertex Blinn Inline : 6080.11
Vertex Blinn Manual : 6012.31
Vertex Phong :        6098.21 (This was the only time when Non inline did better than inline)
Vertex Phong Inline : 5998.81
Pixel Phong :         6101.12 
Pixel Phong inline :  6135.34

2. My laptop running Intel integrated graphics
Shader Mode :         FPS
Stored :              71.9
Vertex Blinn :        68.14
Vertex Blinn Inline : 68.07
Vertex Blinn Manual : 68.01
Vertex Phong :        66.3
Vertex Phong Inline : 72.34
Pixel Blinn :         81.46
Pixel Phong :         80.36

3. Raspberry pi Model B running the Raspbian os (Not sure what video card it was running):
Shader Mode :         FPS
Stored :              6.31
Vertex Blinn :        7.21
Vertex Blinn Inline : 6.99
Vertex Blinn Manual : 7.20
Vertex Phong :        7.12
Vertex Phong Inline : 7.66
Pixel Blinn :         8.91
Pixel Phong :         8.66

Summary of Results :
Clearly, having a GPU is worth it. Factor of 10 improvement on integrated graphics on identical settings and a factor of 100 over the $39.99 Pi. When it comes to the individual shaders themselves, Inline seems to be slightly faster than defining the lighting as a seperate function - but I'd have to do more rigorous error analysis to confirm this. In addition Pixel Phong/Blinn also seemed to do marginally better than the Vertex Phong/Blinn - Maybe the interpolation on the fragment shader is more efficient? Or is this just communication cost?

Thigns that were not explored : 
1. I did not compare int vs float. I spent ~8 hours just getting a Raspbian installed on my pi through ssh. (The final benchmarks were done with the pi hooked up to a display).
2. I did not compare different versions of Nvidia. My desktop does indeed have a Nvidia card, but as of yet I haven't got the driver working properly on it. 

References : 
1. I played around with getting the sphere to work properly, but I ended up using a modified version of the spheres.cpp found here (https://github.com/joshkillinger/graphics/blob/master/hw3/Sphere.cpp) I did consider making the number of vertices changeable, but I just ran out of time.
2. I used the shaders in ex04
