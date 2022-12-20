function bool = exists(B, element, k, seeds)
    bool = true;
    for i = 1 : k
        hash = DJB31MA(element, seeds(i));
        index = mod(hash, length(B)) + 1;
        if (B(index) ~= 1)
            bool = false;
            return
        end
    end
end