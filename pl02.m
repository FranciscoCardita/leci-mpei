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

%% func
function prob1 = probA(p,k,n)
    prob1 = nchoosek(n,k)*p^k*(1-p)^(n-k);
end