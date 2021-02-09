function [s,t] = GraphPoints (n, connections)
%s=[];
%t=[];
edges=0;
for i = 1:n+1
    for j = i:n+1
        if connections (i, j) == true           
            %s = horzcat(s, j);
            %t = horzcat(t, i);
            edges = edges + 1;
        end
    end
end

k = 0;
s = zeros(1, edges);
t = zeros(1, edges);
for i = 1:n+1
    for j = 1:n+1
        if(j>i)
        if connections (i,j) == true 
           k = k+1;
           s(k) = j;
           t(k) = i;
        end
        end
    end
end
    
    
    
    
    

end