%% Ex1a
T = [0.7 0.8; 0.3 0.2];
v = [1 0]';

prob = T^2 * v
prob(1)

%% Ex1b
T = [0.7 0.8 ; 0.3 0.2];
v = [0 1]';

prob = T^2 * v;
prob(1)

%% Ex1c
T = [0.7 0.8 ; 0.3 0.2];
v = [1 0]';

prob = T^29 * v;
prob(1)

%% Ex1d
T = [0.7 0.3 ; 0.8 0.2];
v = [0.85 0.15];
classes = 30;
res = zeros(1, classes);
res(1) = 0.15;

for i = 2 : classes
    res(i) = v(2);
    v = v * T;
end

stem(res)

%% Ex2abc
T = [1/3 1/4 0
     1/3 11/20 1/2
     1/3 1/5 1/2];
v = [0.5 0.25 0.25]';
res = T^29 * v;
res = res.*90;
res = round(res, 0)

%% Ex2d
T = [1/3 1/4 0
     1/3 11/20 1/2
     1/3 1/5 1/2];
v = [1/3 1/3 1/3]';
res = T^29 * v;
res = res.*90;
res = round(res, 0)

%% Ex3
T = rand(20);
T = T ./ sum(T);

v = zeros(20, 1);
v(1) = 1;
tr = [2 5 10 100];
res = zeros(1, 4);

for i = 1 : length(tr)
    prob = T^tr(i) * v;
    res(i) = prob(20);
end

fprintf("%.5f%% \n", res*100);

%% Ex4
p = 0.4; q = 0.6;
T = [p^2 0 0 q^2
     (1-p)^2 0 0 q*(1-q)
     p*(1-p) 0 0 q*(1-q)
     p*(1-p) 1 1 (1-q)^2];
v = zeros(4,1);
v(1) = 1;
tr = [5 10 100 200];
res = zeros(4, 4);
for i = 1 : length(tr)
    for j = 1 : 4
        prob = T^tr(i) * v;
        res(i, j) = prob(i);
    end
end

res

%% Ex5ab
T = [0.7 0.2 0.3
     0.2 0.3 0.3
     0.1 0.5 0.4];
v = [1; 0; 0];

prob = (T * v);
prob(1)^2

%% Ex5c
T = [0.7 0.2 0.3
     0.2 0.3 0.3
     0.1 0.5 0.4];

