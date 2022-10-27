%% Ex1
probX = ones(1,6)/6;
lados = 1:6;   

subplot(1,2,1);
stem(lados, probX);

subplot(1,2,2);
FX = cumsum([0 0 pX 0 0]);
stairs(-1:8, FX);

%% Ex2a
sample = 1:100;
pNota = ones(1,100)/100;

subplot (2, 1, 1);
stem(sample, pNota);

%% Ex2b
notas = [5 50 100];
casos = [90 9 1];
probX = casos/100;

%% Ex2c
pNota = ones(1,100)/100;

subplot (2, 1, 2);
Fx = cumsum([0 0 pNota 0 0]);
stairs(-1:102, Fx);

%% Ex4 (Realizado em grupo)
N = 1e5; p = 0.3; n = 5;

xi = 0:5;
probX = zeros(1,5);
amostras = rand(n,N) <= p;

for k = 0 : 5
    sucesso = sum(amostras) == k;
    probX(k+1) = sum(sucesso)/N;
end

FX = cumsum([0 probX 0]);
stairs(-1:6, FX);

Prob = sum(sum(amostras)<=2)/N;

%% Ex6a_b (Realizado em grupo)
p = 1/1000; n = 8000; k = 7;

% Poisson
lambda = n * p;
pX1 = ((lambda^k)/factorial(k))*(exp(-lambda));

% Binomial
% pX2 = factorial(n)/(factorial(n-k)*factorial(k)*p^k*(1-p)^(n-k));
pX2 = prod(n:-1:n-k+1)/prod(1:k)*p^k*(1-p)^(n-k);

%% Ex7a
n = 1; p = 15; k = 0;

lambda = p * n;
pk = lambda^k * exp(-lambda) / factorial(k);

%% Ex7b
n = 1; p = 15; k = 10; lambda = p * n;
x = 0;

for i = 0 : k
    x = x + lambda^i * exp(-lambda) / factorial(i);
end
p = 1 - x;

%% Ex8
lambda = 0.02; n = 100;

lambda = lambda * n;
pk = 0;

for k = 0 : 1
    pk = pk + lambda^k * exp(-lambda) / factorial(k);
end