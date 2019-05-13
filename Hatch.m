clear all
clc

h1 = 7;
h2 = 1;
w = 3;
r = 7;



% h2 = sqrt(r^2-(w/2)^2);
% h1 = h2+r;

h2 = (h1^2-(w/2)^2)/(2*h1);
r = sqrt(h2^2+(w/2)^2);


disp(2*r)
% disp(h1)

x = (0:0.1:2*pi).';
circle = [cos(x),sin(x)]*r + [5,h2];

figure(1),clf
hold on
axis equal
axis([0,10,0,10])
fill(circle(:,1),circle(:,2),'-b')



