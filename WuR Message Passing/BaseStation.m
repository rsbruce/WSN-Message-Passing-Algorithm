classdef BaseStation
    
    properties
        Xpos
        Ypos
        Pos 
       
    end
    
    methods 
        function obj = BaseStation(xpos,ypos)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            obj.Xpos = xpos/2;
            obj.Ypos = ypos/2;
            obj.Pos = [obj.Xpos obj.Ypos];
        end
        
        
      
        end
end


