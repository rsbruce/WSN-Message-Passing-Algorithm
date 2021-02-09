function [Network] = CreateNodes (n, dimension)
    
Network = Node.empty(n,0);
x = zeros (1, sqrt(n));
y = zeros (1, sqrt(n));

for i = 1:sqrt(n)    
        x(i) = (i-1)* dimension/(sqrt(n));                
end

for j = 1:sqrt(n)
        y(j) = (j-1)* dimension/(sqrt(n));
end
i = 0;
j = 1;
k = 0;
while (k<n)
    d = 21 + 4*rand;
    i = i+1;
    k = k+1;
    if j == sqrt(n) + 1
            j = 1;
    end
    Network(k) = Node(x(i),y(j),k,d);
    
    if i == sqrt(n)
        i = 0;
        j = j+1; 
       
    end
    
end
end

