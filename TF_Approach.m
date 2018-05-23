m1 = 2500;
m2 = 320;
k1 = 8e4;
k2 = 5e5;
b1 = 350;
b2 = 15020;

num_u = [(m1+m2) b2 k2];
den_u = [m1*m2 m1*(b1+b2)+m2*b1 m1*(k1+k2)+m2*k1+b1*b2 b1*k2+b2*k1 k1*k2];
printsys(num_u,den_u);
figure(1);
step(num_u,den_u);

num_w = [-m1*b2 -m1*k2 0 0];
den_w = [m1*m2 m1*(b1+b2)+m2*b1 m1*(k1+k2)+m2*k1+b1*b2 b1*k2+b2*k1 k1*k2];
printsys(num_w,den_w);
figure(2);
step(0.1*num_w,den_w);


A = [0 -k1/m1 0 k1/m2;
    1 -b1/m1 0 b1/m2;
    0 0 0 -k2/m2;
    0 0 1 -b2/m2];

B = [1 0;
    0 0;
    0 k2;
    0 b2];

C = [0 1/m1 0 -1/m2];

D = [0 0];

% sys = ss(A,B,C,D);
% printsys(A,B,C,D);
% figure(1);
% step(A,B,C,D,1);
% figure(2);
% step(A,B,C,D,2);

Kp = 4.5e5;
Ki = 2e4;
Kd = 8.1e5;