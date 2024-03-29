clc
clear all
close all
cd  PL04

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
    arr = zeros(1, N);
    tic
    for j = 1 : N
        hashcode = string2hash(keys{j});
        index = abs(mod(hashcode, sizes(i))) + 1;
        arr(j) = index;
    end
    sim1{i, 1} = arr;
    sim1{i, 2} = length(arr) - length(unique(arr));
    sim1{i, 3} = toc;
end

for i = 1 : length(sizes)
    arr = zeros(1, N);
    tic
    for j = 1 : N
        hashcode = string2hash(keys{j}, 'sdbm');
        index = abs(mod(hashcode, sizes(i))) + 1;
        arr(j) = index;
    end
    sim2{i, 1} = arr;
    sim2{i, 2} = length(arr) - length(unique(arr));
    sim2{i, 3} = toc;
end

for i = 1 : length(sizes)
    arr = zeros(1, N);
    tic
    for j = 1 : N
        hashcode = hashstring(keys{j}, sizes(i));
        index = hashcode + 1;
        arr(j) = index;
    end
    sim3{i, 1} = arr;
    sim3{i, 2} = length(arr) - length(unique(arr));
    sim3{i, 3} = toc;
end

for i = 1 : length(sizes)
    arr = zeros(1, N);
    tic
    for j = 1 : N
        hashcode = DJB31MA(keys{j}, 123);
        index = abs(mod(hashcode, sizes(i))) + 1;
        arr(j) = index;
    end
    sim4{i, 1} = arr;
    sim4{i, 2} = length(arr) - length(unique(arr));
    sim4{i, 3} = toc;
end

%% Ex3a.i
for i = 1 : 3
    figure()
    subplot(4,1,1)
    histogram(sim1{i, 1}, 100)
    title('djb2')
    subplot(4,1,2)
    histogram(sim2{i, 1}, 100)
    title('sbdm')
    subplot(4,1,3)
    histogram(sim3{i, 1}, 100)
    title('hashstring')
    subplot(4,1,4)
    histogram(sim4{i, 1}, 100)
    title('DJB31MA')
end

%% Ex3b
figure()
hold on

plot(sizes, [sim1{:, 2}])
plot(sizes, [sim2{:, 2}])
plot(sizes, [sim3{:, 2}])
plot(sizes, [sim4{:, 2}])

title('No. of collisions')
legend('djb2', 'sdbm', 'hashstring', 'DJB31MA')

%% Ex3c
figure()
hold on

plot(sizes, [sim1{:, 3}])
plot(sizes, [sim2{:, 3}])
plot(sizes, [sim3{:, 3}])
plot(sizes, [sim4{:, 3}])

title('Execution time')
legend('djb2', 'sdbm', 'hashstring', 'DJB31MA')

%% Ex4
N = 1e5;
imin = 6;
imax = 20;
chars = 'a':'z';
probs = load("prob_pt.txt"); 

keys = keyGen(N, imin, imax, chars, probs);
sizes = [5e5 1e6 2e6];

[sim1, sim2, sim3, sim4] = deal(cell(3));

for i = 1 : length(sizes)
    arr = zeros(1, N);
    tic
    for j = 1 : N
        hashcode = string2hash(keys{j});
        index = abs(mod(hashcode, sizes(i))) + 1;
        arr(j) = index;
    end
    sim1{i, 1} = arr;
    sim1{i, 2} = length(arr) - length(unique(arr));
    sim1{i, 3} = toc;
end

for i = 1 : length(sizes)
    arr = zeros(1, N);
    tic
    for j = 1 : N
        hashcode = string2hash(keys{j}, 'sdbm');
        index = abs(mod(hashcode, sizes(i))) + 1;
        arr(j) = index;
    end
    sim2{i, 1} = arr;
    sim2{i, 2} = length(arr) - length(unique(arr));
    sim2{i, 3} = toc;
end

for i = 1 : length(sizes)
    arr = zeros(1, N);
    tic
    for j = 1 : N
        hashcode = hashstring(keys{j}, sizes(i));
        index = hashcode + 1;
        arr(j) = index;
    end
    sim3{i, 1} = arr;
    sim3{i, 2} = length(arr) - length(unique(arr));
    sim3{i, 3} = toc;
end

for i = 1 : length(sizes)
    arr = zeros(1, N);
    tic
    for j = 1 : N
        hashcode = DJB31MA(keys{j}, 123);
        index = abs(mod(hashcode, sizes(i))) + 1;
        arr(j) = index;
    end
    sim4{i, 1} = arr;
    sim4{i, 2} = length(arr) - length(unique(arr));
    sim4{i, 3} = toc;
end

for i = 1 : 3
    figure()
    subplot(4,1,1)
    histogram(sim1{i, 1}, 100)
    title('djb2')
    subplot(4,1,2)
    histogram(sim2{i, 1}, 100)
    title('sbdm')
    subplot(4,1,3)
    histogram(sim3{i, 1}, 100)
    title('hashstring')
    subplot(4,1,4)
    histogram(sim4{i, 1}, 100)
    title('DJB31MA')
end

figure()
hold on

plot(sizes, [sim1{:, 2}])
plot(sizes, [sim2{:, 2}])
plot(sizes, [sim3{:, 2}])
plot(sizes, [sim4{:, 2}])

title('No. of collisions')
legend('djb2', 'sdbm', 'hashstring', 'DJB31MA')

figure()
hold on

plot(sizes, [sim1{:, 3}])
plot(sizes, [sim2{:, 3}])
plot(sizes, [sim3{:, 3}])
plot(sizes, [sim4{:, 3}])

title('Execution time')
legend('djb2', 'sdbm', 'hashstring', 'DJB31MA')

%% ------ 4.2 ------
% Ex1
n = 8000;
k = 3;
file = readlines('wordlist-preao-20201103.txt');
U1 = file(1:1000);

bloomFilter = initBloom(n);

seeds = randi(2^32, k);
for i = 1 : length(U1)
    bloomFilter = insert(bloomFilter, convertStringsToChars(U1(i)), k, seeds);
end

% Ex2
bool = zeros(1, length(U1));
for i = 1 : length(U1)
    bool(i) = exists(bloomFilter, convertStringsToChars(U1(i)), k, seeds);
end
fprintf('False negatives: %.2f%%\n', length(find(bool==0))*100/length(bool))

% Ex3
U2 = file(1001:11001);
bools = zeros(1, length(U2));
for i = 1 : length(U2)
    bools(i) = exists(bloomFilter, convertStringsToChars(U2(i)), k, seeds);
end
fprintf('False negatives: %.2f%%\n', length(find(bools==0))*100/length(bools))

% Ex4
m = length(U1);
fprintf('Practical: %.2f%%\n', length(find(bool==0))*100/length(bool))
fprintf('Theoretical: %.2f%%\n', (1-exp(-(k*m)/n))^k*100)

%% Ex5
n = 8000;
k = 4:10;
file = readlines('wordlist-preao-20201103.txt');
U1 = file(1:1000);
falsePositives = zeros(1, 7);
for i = 1 : 7
    bloomFilter = initBloom(n);
    
    seeds = randi(2^32, k(i));
    for j = 1 : length(U1)
        bloomFilter = insert(bloomFilter, convertStringsToChars(U1(j)), k(i), seeds);
    end

    U2 = file(1001:11001);
    bools = zeros(1, length(U2));
    for j = 1 : length(U2)
        bools(j) = exists(bloomFilter, convertStringsToChars(U2(j)), k(i), seeds);
    end

    falsePositives(i) = length(find(bools))/length(bools);

end

plot(k, falsePositives)

m = length(U1);
fprintf('Practical: %.2f%%\n', k(find(falsePositives==min(falsePositives))))
fprintf('Theoretical: %.2f%%\n', (n*log(2))/m)

%% ------ 4.3 ------
% Ex1
udata = load('u.data'); % Carrega o ficheiro dos dados dos filmes
% Fica apenas com as duas primeiras colunas
u = udata(1:end,1:2); clear udata;

% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores
Nu = length(users);     % Número de utilizadores

% Constrói a lista de filmes para cada utilizador
Set = cell(Nu,1);    % Usa células
for n = 1 : Nu       % Para cada utilizador
    % Obtém os filmes de cada um
    ind = find(u(:,1) == users(n));
    % E guarda num array. Usa células porque utilizador tem um número
    % diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,2)];
end

% Calcula a distância de Jaccard entre todos os pares pela definição.

J = zeros(Nu); % array para guardar distâncias
h = waitbar(0,'Calculating');
for n1 = 1 : Nu
    waitbar(n1/Nu,h);
    for n2 = n1+1 : Nu
        C1 = Set{n1, 1};
        C2 = Set{n2, 1};
        J(n1, n2) = 1 - length(intersect(C1, C2))/length(union(C1, C2));
    end
end
delete(h)

% Com base na distância, determina pares com
% distância inferior a um limiar pré-definido

threshold = 0.4; % limiar de decisão

% Array para guardar pares similares (user1, user2, distância)
SimilarUsers = zeros(1,3);
k = 1;
for n1 = 1 : Nu
    for n2 = n1+1 : Nu
        if J(n1, n2) < threshold
            SimilarUsers(k,:) = [users(n1) users(n2) J(n1,n2)];
            k = k+1;
        end
    end
end
