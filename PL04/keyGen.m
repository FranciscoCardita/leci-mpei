function keys = keyGen(N, imin, imax, chars, probs)
    if nargin < 5
        probs = ones(1,length(chars));
        probs = probs./sum(probs);
    end
    for i = 1 : N
       str = [];
       for j = 1 : randi([imin, imax])
           str(j) = discrete_rnd(chars, probs);
       end
       keys{i} = strcat(str);
    end
end