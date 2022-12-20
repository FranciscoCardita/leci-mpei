function B = insert(B, element, k, seeds)
    for i = 1 : k
        hash = DJB31MA(element, seeds(i));
        index = mod(hash, length(B)) + 1;
        B(index) = 1;
    end
end