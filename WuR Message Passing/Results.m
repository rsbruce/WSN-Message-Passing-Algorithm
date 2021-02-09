p = plot(G);
SPTree = shortestpathtree(G,n+1);
highlight(p,SPTree,'EdgeColor','r');

energies = zeros(n,1);
%find energy expended by all nodes in (nx1) column vector
for i = 1:n
    energies(i) = Network(i).energy;
end


%find no.of dependent nodes in (nx1) column vector
countdeps = zeros(n,1);
epd = zeros(n,1);
for i = 1:n
  countdeps(i) = size(findDependents(Network(i),Network),2) + 1;  
  epd (i) = energies(i)/countdeps(i);
end

%find children for all nodes in (nx1) column vector
countchildren = zeros(n,1);
for i=1:n
    countchildren(i) =size(Network(i).child,2);
end

%scalar number of hops required to get a request to all nodes
numphops = 0;
for i=1:n
    numphops = numphops + (size(shortestpath(G,i,n+1),2)-1);
end

result(1,1) = mean(energies);
result(2,1) = max(energies);
result(3,1) = min(energies);
result(4,1) = mean(countdeps) - 1;
result(5,1) = mean(numphops);
result