classdef Node < handle
    properties
        ID
        Xpos
        Ypos
        Pos 
        parent    
        child
        energy = 0
        data
    end
    events
         
    end
    
    methods
    
    function obj = Node(xpos, ypos, ID, data)
        obj.Xpos = xpos;
        obj.Ypos = ypos;
        obj.ID = ID;
        obj.data = data;
        obj.Pos = [obj.Xpos obj.Ypos];
       
    end
    end
end
    