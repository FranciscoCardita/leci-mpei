%% Código 1
% Gerar uma matriz com 3 linhas e 10000 colunas de nu´meros aleato´rios
% entre 0.0 e 1.0 (ou seja, cada coluna representa uma experieˆncia):
experiencias = rand(3,10000);
% Gerar uma matriz com 3 linhas e 10000 colunas com o valor 1 se o valor
% da matriz anterior for superior a 0.5 (ou seja, se saiu cara) ou com o
% valor 0 caso contra´rio (ou seja, saiu coroa):
lancamentos = experiencias > 0.5; % 0.5 corresponde a 1 - prob. de caras
% Gerar um vetor linha com 10000 elementos com a soma dos valores de cada
% coluna da matriz anterior (ou seja, o nu´mero de caras de cada experieˆncia):
resultados = sum(lancamentos);
% Gerar um vetor linha com 10000 elementos com o valor 1 quando o valor do
% vetor anterior e´ 2 (ou seja, se a experieˆncia deu 2 caras) ou 0 quando e´
% diferente de 2:
sucessos = resultados == 2;
% Determinar o resultado final dividindo o nu´mero de experieˆncias com 2
% caras pelo nu´mero total de experieˆncia
probSimulacao = sum(sucessos)/10000

%% Código 1 - segunda versão
N = 1e5; %nu´mero de experieˆncias
p = 0.5; %probabilidade de cara
k = 2; %nu´mero de caras
n = 3; %nu´mero de lanc¸amentos
lancamentos = rand(n,N) > p;
sucessos = sum(lancamentos) == k;
probSimulacao = sum(sucessos)/N

%% Ex2
N = 1e5; % número de experiências
p = 0.5; % probabilidade de cara
k = 6; % número de caras
n = 15; % número de lançamentos
lancamentos = rand(n,N) > p;
sucessos = sum(lancamentos) == k;
probSimulacao = sum(sucessos)/N

%% Ex3
N = 1e5; % número de experiências
p = 0.5; % probabilidade de cara
k = 6; % número de caras
n = 15; % número de lançamentos
lancamentos = rand(n,N) > p;
sucessos = sum(lancamentos) >= k;
probSimulacao = sum(sucessos)/N

%% Ex4
N = 1e5; % número de experiências
p = 0.5; % probabilidade de cara
for i = [20 40 100]
    for k = 0 : i
        prob(k+1) = sum(sum(rand(k, N)>p)==k)/N;
    end
    figure(1)
    stem(prob)
    title("Prob")
end

%% Ex5
p = 0.5;
k = 2;
n = 3;
prob = nchoosek(n,k)*p^k*(1-p)^(n-k);

%% Ex6a
p = 0.3;
n = 5;
k = 3;
N = 1e5;
prob = nchoosek(n,k)*p^k*(1-p)^(n-k)

r = rand(n,N) <= p;
faulty = sum(r) == k;
probSim = sum(faulty) / N

%% Ex6b
p = 0.3;
n = 5;
k = 2;
N = 1e5;

prob = probA(p,0,n) + probA(p,1,n) + probA(p,2,n)
r = rand(n,N) <= p;
faulty = sum(r) <= k;
probSim = sum(faulty) / N

%% Ex6c
p = 0.3;
n = 5;
k = 3;
N = 1e5;
prob = nchoosek(n,k)*p^k*(1-p)^(n-k)

r = rand(n,N) <= p;
faulty = sum(r) == k;
probSim = sum(faulty) / N

histogram(sum(r))

%% func
function prob1 = probA(p,k,n)
    prob1 = nchoosek(n,k)*p^k*(1-p)^(n-k);
end