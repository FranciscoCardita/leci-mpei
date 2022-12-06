clc
clear all
close all

%% Ex1a
N = 1e5;
imin = 6;
imax = 20;
chars = ['a':'z' 'A':'Z'];

keyGen(N, imin, imax, chars)

%% Ex1b
N = 1e5;
imin = 6;
imax = 20;
chars = 'a':'z';
probs = load("prob_pt.txt");

keyGen(N, imin, imax, chars, probs)

%% Ex2
N = 1e5;
imin = 6;
imax = 20;
chars = ['a':'z' 'A':'Z'];

keys = keyGen(N, imin, imax, chars);
sizes = [5e5 1e6 2e6];

[sim1, sim2, sim3, sim4] = deal(cell(3));

for i = 1 : length(sizes)
    hashcodes = zeros(1, length(keys));
    
    collisions = 0;
    tic
end
