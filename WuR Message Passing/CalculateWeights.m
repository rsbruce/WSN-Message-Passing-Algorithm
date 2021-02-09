
function [weight] = CalculateWeights (distances, Network, n, connections)
%if no link exists between nodes, weight is considered inf according to
%Dijkstra
weight = inf (n+1);
%arbitrary values to be tweaked for better performance
a = 1;
b = 10*a;

for i = 1:n
    for j = 1:n
        if connections(i,j)==true 
%chance of link failure increases with the square of distance and energy
%spent
weight(i,j) = a*distances(i, j)^2 + b*(( Network(i).energy) + (Network(j).energy));
        end
    end
end

%weights of connection to BS where distance is not a factor
%this avoids nodes in range of BS not connecting to BS
for i = 1:n
    weight(n+1,i) = b*(Network(i).energy);
    weight(i,n+1) = weight(n+1,i);
end

end