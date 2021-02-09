function [dist2BS] = calcBSDist (n, objarray, BS)
dist2BS = zeros (n, 1);
for i = 1:n
     dist2BS(i) = sqrt((objarray(i).Xpos - BS.Xpos)^2 + (objarray(i).Ypos - BS.Ypos)^2);
end
end
