classdef item < handle
    properties
        where
        cost
        name
    end
    
    methods
        function self = item(name,cost,where)
            self.name = name;
            if exist('cost','var') && ~isempty(cost)
                self.cost = cost;
            end
            if exist('where','var') && ~isempty(where)
                self.where = where;
            end
        end
        
        function c = mtimes(a,b)
            if isa(a,'double')
                number = a;
                material = b;
            else
                number = b;
                material = a;
            end
            c = item.empty();
            c(1:number) = material;
        end
    end
end