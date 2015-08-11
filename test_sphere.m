figure;
hold on;
axis equal
[x y z] = sphere(128);
h = surface(x, y, z); 
set(h, 'FaceAlpha', 0.5)
shading flat

[x y z] = sphere(128);
r=3;
h = surfl(r*x, r*y, z); 
set(h, 'FaceAlpha', 0.5)
shading flat


