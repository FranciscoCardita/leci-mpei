clc
clear all
close all

%% Ex1
function keys = hash(N, imin, imax, chars, probs)
    if nargin() < 5
        probs = ones(1,length(chars));
        probs = probs./sum(probs);
    end
    for i = 1 : N
       for j = 1 : randi([imin, imax])
       end
    end
end

function state = discrete_rnd(states, probVector)
    U = rand();
    i = 1 + sum(U > cumsum(probVector));
    state = states(i);
end

% Ex1a
% chars = ['a':'z' 'A':'Z']