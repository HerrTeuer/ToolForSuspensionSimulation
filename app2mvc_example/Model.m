classdef Model < handle
    %UNTITLED5 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        balance   % 简单起见，把balance设置成public属性。
    end
    
    events
        balanceChanged
    end
    
    methods
        function obj = Model(balance)
            obj.balance = balance;
        end
        function deposit(obj,val)
            obj.balance = obj.balance + val;
            obj.notify('balanceChanged');
        end
        function withDraw(obj,val)
            obj.balance = obj.balance - val;
            obj.notify('balanceChanged');
        end
    end
    
end