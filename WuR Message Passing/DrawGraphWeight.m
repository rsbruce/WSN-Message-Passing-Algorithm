function [G] = DrawGraphWeight (s, t, weights)

edgeWeight = zeros (1,size(s,2));

for i = 1:size(s,2)    
        edgeWeight(i) = weights(s(i), t(i));
   
end
G=graph(s,t,edgeWeight);
%plot(G)
%plot(G,'EdgeLabel',G.Edges.Weight);
end