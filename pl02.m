%% Ex1a
N = 1e5;
p = 0.5;
n = 2;
k = 1;

filhos = rand(n, N) < p;
sucessos = sum(filhos) >= k;
prob = sum(sucessos)/N

%% Ex1c
N = 1e5;
p = 0.5;
n = 2;
k = 1;

lancamentos = rand(n, N) > p;
%P(B)
peloMenosUmRapaz = sum(lancamentos) >= k;
probPeloMenosUmRapaz = sum(peloMenosUmRapaz)/N;
%P(AnB)
doisRapazes = sum(lancamentos) == 2;
probDoisRapazes = sum(doisRapazes)/N;
%P(A|B) = P(AnB)/P(B)
probSim = probDoisRapazes/probPeloMenosUmRapaz

%% Ex1d
N = 1e5;
p = 0.5;
n = 2;
k = 1;

lancamentos = rand(n,N) > p;
doisRapazes = sum(lancamentos) == 2;
primeiroFilho = lancamentos(1,:);
probSim = doisRapazes/primeiroFilho

%% Ex1e
N = 1e5;
p = 0.5;
n = 5;
k = 1;

lancamentos = rand(n,N) > p;
umRapaz = sum(lancamentos) >= 1;
outroRapaz = sum(lancamentos) == 2;
probSim = outroRapaz / umRapaz

%% Ex1f
N = 1e5;
p = 0.5;
n = 5;
k = 1;

lancamentos = rand(n,N) > p;
umRapaz = sum(lancamentos) >= 1;
outroRapaz = sum(lancamentos) >= 2;
probSim = outroRapaz / umRapaz

%% Ex2a
N = 1e5; p = 0.5; n = 20; m = 100;

oneOrLess = 0;
for matrix = randi(m,n,N)
    if length(unique(matrix)) == n
        oneOrLess = oneOrLess + 1;
    end
end
probSim = oneOrLess/N

%% Ex2b
N = 1e5; p = 0.5; n = 20; m = 100;

twoOrMore = 0;
for matrix = randi(m,n,N)
    if length(unique(matrix)) < n-1
        twoOrMore = twoOrMore + 1;
    end
end
probSim = twoOrMore/N

%% Ex2c
N = 1e5; n = linspace(10,100,10); probSim = zeros(1,10);
m = [1000 100000];

for i = 1 : 2
    for j = 1 : length(n)
        cnt = 0;
        for matrix = randi(m(i),n(j),N)
            if length(unique(matrix)) < n(j)-1
                cnt = cnt + 1;
            end
        end
        probSim(j) = cnt/N;
    end
    subplot(2,1,i)
    plot(n,probSim)
end

%% Ex2d
N = 1e5; n = 100;
m = [200 500 1000 2000 5000 10000 20000 50000 100000];

for i = 1 : length(m)
    cnt = 0;
    for matrix = randi(m(i),n,N)
        if length(unique(matrix)) < n-1
            cnt = cnt + 1;
        end
    end
    probSim(i) = cnt/N;
end
plot(m,probSim)

%% Ex3a
N = 1e5; T = 1000; k = 10;

cnt = 0;
for matrix = randi(T,k,N)
    if length(unique(matrix)) < k-1
        cnt = cnt + 1;
    end
end
probSim = cnt/N

%% Ex3b
N = 1e5; T = 1000; k = 10:100:1000;

for i = 1 : length(k)
    cnt = 0;
    for matrix = randi(T,k(i),N)
        if length(unique(matrix)) < k(i)-1
            cnt = cnt + 1;
        end
    end
    probSim(i) = cnt/N;
end

plot(k,probSim)

%% Ex3c
N = 1e5; k = 50; T = 100:100:1000;

for i = 1 : length(T)
    cnt = 0;
    for matrix = randi(T(i),k,N)
        if length(unique(matrix)) == k
            cnt = cnt + 1;
        end
    end
    probSim(i) = cnt/N;
end
plot(T,probSim)

%% Ex4a
N = 1e5; y = 365; p = 0.5;

for n = 1 : 40
    cnt = 0;
    for matrix = randi(365,n,N)
        if length(unique(matrix)) ~= n
            cnt = cnt + 1;
        end
    end
    p = cnt/N;
    if p > 0.5
        break;
    end
end
n

%% Ex4b

N = 1e5; y = 365; p = 0.5;

for n = 20 : 100
    cnt = 0;
    for matrix = randi(365,n,N)
        if length(unique(matrix)) ~= n
            cnt = cnt + 1;
        end
    end
    p = cnt/N;
    if p > 0.9
        break;
    end
end
n