function [connections] = CalculateConnections (n,r,dist2BS,distances)

connections = false(n+1);

for i = 1:n
    
    if dist2BS(i) < r 
        connections(i, n+1) = true;
        connections(n+1, i) = true;
    end
    
    for j = 1:n                    
        if (distances (i,j) < r && i ~=j)
            connections(i,j) = true;
        end
    end     
end
end