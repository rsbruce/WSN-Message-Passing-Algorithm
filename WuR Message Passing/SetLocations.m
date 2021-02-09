function [location]  =SetLocations(n,radius)
location = zeros (n,2);
    for i=1:n
        
            location(i,1) = rand*radius;
            location(i,2) = rand*radius;
        
       
    end
