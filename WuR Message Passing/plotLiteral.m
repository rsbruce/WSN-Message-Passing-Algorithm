function [] = plotLiteral (n,dimension,Network, BS, connections)
for i = 1:n
    plot(Network.Xpos, Network.Ypos, 'o');
    hold on
    if i ==1
        plot (BS.Xpos, BS.Ypos, 'r*','MarkerSize',20)
        hold on
    end
    
    if connections(i, n+1) == true
        plot ([BS.Xpos Network(i).Xpos],[BS.Ypos Network(i).Ypos]);
        hold on 
    end
    for j = i:n
        if (j ~= i && connections(i,j) == true)
            plot ([Network(i).Xpos Network(j).Xpos],[Network(i).Ypos Network(j).Ypos],'-o');
            hold on
        end
    end
end
axis ([0 dimension 0 dimension])
end