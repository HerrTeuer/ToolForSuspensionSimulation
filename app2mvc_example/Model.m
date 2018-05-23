classdef Model < handle
    %UNTITLED5 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        balance   % ���������balance���ó�public���ԡ�
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