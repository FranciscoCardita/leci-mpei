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

matrix = randi(m,n,N);
oneOrLess = 0;
for k = 1 : N
    uniqueVal = unique(matrix(:,k));
    if length(uniqueVal) == 20
        oneOrLess = oneOrLess + 1;
    end
end
probSim = oneOrLess/N

%% Ex2b
N = 1e5; p = 0.5; n = 20; m = 100;

matrix = randi(m,n,N);
oneOrMore = 0;
for k = 1 : N
    uniqueVal = unique(matrix(:,k));
    if length(uniqueVal) < 20
        oneOrMore = oneOrMore + 1;
    end
end
probSim = oneOrMore/N

%% Ex2c
N = 1e5; p = 0.5; n = linspace(10,100,10); probSim = zeros(1,10);

for i = 1 : 10
    matrix = randi(1000,n(i),N);
    oneOrMore = 0;
    for j = 1 : N
        if length(unique(matrix(:,j))) ~= n(i)
            oneOrMore = oneOrMore + 1;
        end
    end
    probSim(i) = oneOrMore/N;
end
subplot(1,2,1)
plot(n*10,probSim)