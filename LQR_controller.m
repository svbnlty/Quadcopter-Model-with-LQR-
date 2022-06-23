clear all
clc

m = 0.9928;
g=9.81;    
l=0.24;
Ix=0.00963;
Iy=0.00963;
Iz=0.019;
b=3.59 * 10^(-5);
d=2.081 * 10^(-6);
Jr = 5.225 * 10^(-5);
% Ax=0.1;
% Ay=Ax;
% Az=Ax;
Jr_motor= 6.5 * 10^(-7);
b_motor= 2.415 * 10^(-6);
Kemf= 0.00255;
Kt= 0.00255;


A= [0 0 0 1 0 0 0 0 0 0 0 0;0 0 0 0 1 0 0 0 0 0 0 0;0 0 0 0 0 1 0 0 0 0 0 0;0 0 0 0 0 0 0 -9.81 0 0 0 0;0 0 0 0 0 0 9.81 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 1 0 0;0 0 0 0 0 0 0 0 0 0 1 0;0 0 0 0 0 0 0 0 0 0 0 1;0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0];
B= [0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0;1/m 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0;0 l/Ix 0 0;0 0 l/Iy 0;0 0 0 l/Iz];
C= [1 0 0 0 0 0 0 0 0 0 0 0;
    0 1 0 0 0 0 0 0 0 0 0 0;
    0 0 1 0 0 0 0 0 0 0 0 0;
    0 0 0 1 0 0 0 0 0 0 0 0;
    0 0 0 0 1 0 0 0 0 0 0 0;
    0 0 0 0 0 1 0 0 0 0 0 0;
    0 0 0 0 0 0 1 0 0 0 0 0;
    0 0 0 0 0 0 0 1 0 0 0 0;
    0 0 0 0 0 0 0 0 1 0 0 0;
    0 0 0 0 0 0 0 0 0 1 0 0;
    0 0 0 0 0 0 0 0 0 0 1 0;
    0 0 0 0 0 0 0 0 0 0 0 1]; 
D=zeros(12,4);

H=ss(A,B,C,D);
G=tf(H);
t=0:0.01:15;
P=size(C,1);
[N,M]=size(B);

%v=[1 50 50 50 0 10 1500 1500 50 50 50 10];
%v=[250 250 100 20 10 10 1000 1500 1000 50 50 50];
v=[150 150 100 20 10 10 1000 1500 1000 50 50 50];
Q=diag(v);
R=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
K=lqr(A,B,Q,R);

% J = 0.01; % Moment Inertia of the rotor
% b = 0.1; % Motor viscous friction contant
% K = 0.01; % Electromotive force constant, motor torque constant
% R = 1; % Electrical Resistance
% L = 0.5; % Electrical Inductance
% % Define motor state variable model
% A = [-b/J K/J;-K/L -R/L]
% B = [ 0;1/L ]
% C = [ 1 0 ]
% D = [ 0]
% J = 0.01;
% b = 0.1;
% K = 0.01;
% R = 1;
% L = 0.5;


