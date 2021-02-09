function [distances] = CalculateDists(n, Network)

distances = zeros (n, n);

for i = 1:n
    for j = 1:n
        distances (i,j) = norm(Network(i).Pos - Network(j).Pos);
    end    
end
end

