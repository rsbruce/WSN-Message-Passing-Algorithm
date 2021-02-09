function [dependents] = findDependents(Node, Network)
dependents = [];
if size(Node.child,2)>0
    for i = 1:size(Node.child,2)
        dependents = horzcat(dependents,Node.child(i));
        next = findDependents(Network(Node.child(i)), Network);
        dependents = horzcat(next, dependents);
    end
end




