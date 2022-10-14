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
N = 1e5; p = 0.5; n = linspace(10,100,10); probSim = zeros(1,10);
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