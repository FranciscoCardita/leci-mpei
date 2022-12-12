clc
clear all
close all
% cd  PL04

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
