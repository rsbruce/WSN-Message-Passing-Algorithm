function [sd] = dependentsSize(Node, Network)
sd = size(Node.child, 2);
if size(Node.child, 2) > 0
    for i = 1:size(Node.child, 2)
        next = dependentsSize(Network(Node.child(i)), Network);
        sd = sd + next;
    end
end