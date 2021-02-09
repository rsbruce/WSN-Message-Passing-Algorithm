clear
n = 100; %number of nodes
area = 10; %area in m^2 covered per node
r = 7; %range of a node

dimension = sqrt(area)*sqrt(n); 
roundmax = 1000; %number of rounds simulation will run for
BS = BaseStation(dimension, dimension); %base station postion at the centre

%deploy network
Network = CreateNodes(n, dimension);
distances = CalculateDists (n, Network);
dist2BS = calcBSDist(n,Network, BS);
connections = CalculateConnections (n,r,dist2BS, distances);
[s,t] = GraphPoints (n, connections);



%energy after setup phase

for i = 1:n
    c=0;
       for j = 1:n
           %send a wakeup packet to all nodes
           Network(i).energy = NewEnergy(Network(i), 0); 
           %if a node is in range, respond
           if connections(i,j) == true              
               Network(i).energy = NewEnergy(Network(i), 4); 
               c=c+1;
           end
       end
       %send one packet to the BS, with 4bytes for every neighbouring node
    Network(i).energy = NewEnergy(Network(i), 4*c); 
end

%draw graph
weights = CalculateWeights(distances, Network, n, connections);
G=DrawGraphWeight (s, t, weights);

%assign parents and children to Nodes
for i = 1:n
    P = shortestpath(G, i, n+1);
    if size(P,2)>2
        Network(i).parent = P(2);
        Network(P(2)).child = horzcat(Network(P(2)).child, i);
    end
end

%find first gen nodes
dC = 0;
for i = 1:n
    if connections (i, n+1) == true
        dC=dC+1;
    end
end
directConnect = zeros(1,dC);
j = 0;

for i = 1:n
    if connections(i,n+1) == true
        j = j+1;
        directConnect(j) = i;
    end
end


%main loop
for i = 1:roundmax
  for j = 1:n
      dependents = findDependents(Network(j),Network);
      for k = 1:size(Network(j).child,2) %send one packet per child
          %length of packet depends on that child's no.dependents
          %the instruction is only one byte long
          bytes = size(findDependents(Network(Network(j).child(k)),Network),2);
          Network(j).energy = NewEnergy(Network(j), bytes);
      end
      %finally, report data back to BS, 1 byte for data, 2 bytes each for
      %strength of links to children
      Network(j).energy = NewEnergy(Network(j), 1 + 2*size(Network(j).child,2)); %data out
  end
  

  weights = CalculateWeights(distances, Network, n, connections);
  G=DrawGraphWeight (s, t, weights);
  
 
  %plots tree with changing path in real time
  p = plot(G, 'LineWidth', 2);
  SPTree = shortestpathtree(G,n+1);
  %show updated tree
  highlight(p,SPTree,'EdgeColor','r');
  pause(0.5);
  %flashes green when messages are sent
  highlight(p,SPTree,'EdgeColor','g');
  pause(0.5)
  highlight(p,SPTree,'EdgeColor','r');
  
  
  %clear children
  for z = 1:n
    Network(z).child=[];  
  end
      
  %assign parents and children
for q = 1:n
    %shortestpath in MATLAB is the built-in function for Dijkstra
    %shortest paths are found based on changing weight function
    P = shortestpath(G, q, n+1);
    if size(P,2)>2
        Network(q).parent = P(2);
        Network(P(2)).child = horzcat(Network(P(2)).child, q);
    end
end  
  
end

  %plot of final tree
  p = plot(G, 'LineWidth', 2);
  SPTree = shortestpathtree(G,n+1);
  highlight(p,SPTree,'EdgeColor','r');


