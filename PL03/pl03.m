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
v0 = [1; 0; 0];

v1 = (T * v0); % primeira transição
prob1 = sum(v1(1:2));
v1(3) = 0;
v1 = v1/sum(v1(1:2));

v2 = T * v1;
prob2 = sum(v2(1:2));

res = prob1 * prob2

%% Ex5d
T = [0.7 0.2 0.3
     0.2 0.3 0.3
     0.1 0.5 0.4];
v0 = [1; 0; 0];

v1 = T^30 * v0;

sunny = round(v1(1)*31)
cloudy = round(v1(2)*31)
rainy = round(v1(3)*31)

%% Ex5e
T = [0.7 0.2 0.3
     0.2 0.3 0.3
     0.1 0.5 0.4];
v0 = [0; 0; 1];

v1 = T^30 * v0;

sunny = round(v1(1)*31)
cloudy = round(v1(2)*31)
rainy = round(v1(3)*31)

%% Ex5f
T = [0.7 0.2 0.3
     0.2 0.3 0.3
     0.1 0.5 0.4];
p = [0.1; 0.3; 0.5];

% primeiro dia sol
v0 = [1; 0; 0];
v1 = T^30 * v0;

days = round((v1 * 31) .* p);
res = sum(days)

%% Ex6ab
T = [.8 0 0 .3 0
     .2 .6 0 .2 0
     0 .3 1 0 0
     0 .1 0 .4 0
     0 0 0 .1 1];
v0 = zeros(1,5)';
v0(1) = 1;
n = 100;

probs = [n];
for i = 1 : n
    v1 = T^i * v0;
    probs(i) = v1(2);
end
stem(probs)

%% Ex6c
T = [.8 0 0 .3 0
     .2 .6 0 .2 0
     0 .3 1 0 0
     0 .1 0 .4 0
     0 0 0 .1 1];
v0 = zeros(1,5)';
v0(1) = 1;
n = 100;

probs = [n];
for i = 1 : n
    v1 = T^i * v0;
    probs(i) = v1(3);
end
hold on
stem(probs)

probs = [n];
for i = 1 : n
    v1 = T^i * v0;
    probs(i) = v1(5);
end
stem(probs)
legend('State 3', 'State 5')

%% Ex6def
Q = [0.8 0.0 0.3
     0.2 0.6 0.2
     0.0 0.1 0.4];
F = inv(eye(3)-Q);
A = [0.8 0.0 0.0 0.3 0.0
     0.2 0.6 0.0 0.2 0.0
     0.0 0.3 1.0 0.0 0.0
     0.0 0.1 0.0 0.4 0.0
     0.0 0.0 0.0 0.1 1.0];
t = sum(F);
t(1)
t(2)
t(3)

%% Ex6g
Q = [0.8 0.0 0.3
     0.2 0.6 0.2
     0.0 0.1 0.4];
F = inv(eye(3)-Q);
R = [0.0 0.3 0.0
     0.0 0.0 0.1];

B = R * F;
B(1, 1)
B(2, 1)

%% Ex7acd
H = [0 0 0 0 1/3 0
    1 0 0 0 1/3 0
    0 1/2 0 1 0 0
    0 0 1 0 0 0
    0 1/2 0 0 0 0
    0 0 0 0 1/3 0];
N = length(H);
H(:, find(sum(H)==0)) = ones(N, 1)/N;
H

b = 0.8;
A = b * H + (1-b) * (1./(ones(N)*N))
