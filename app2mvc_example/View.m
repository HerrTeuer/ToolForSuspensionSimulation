classdef View < matlab.apps.AppBase
    
    % Properties that correspond to app components
    properties (Access = public)
        BankUIFigure           matlab.ui.Figure
        BalanceEditFieldLabel  matlab.ui.control.Label
        RMBEditFieldLabel      matlab.ui.control.Label
        ViewBalance            matlab.ui.control.NumericEditField
        ViewRMB                matlab.ui.control.NumericEditField
        WithdrawButton         matlab.ui.control.Button
        DepositButton         matlab.ui.control.Button
        
        controlObj            % (2)
        modelObj              % (2)
    end
    
    
    properties (Access = public)
        Balance double % Description
    end

    methods (Access = private)
        
        % Code that executes after component creation
        function startupFcn(app)
            app.controlObj = Controller(app,app.modelObj);   % (3)
            app.attatchToController(app.controlObj);         % (3)
            
            app.modelObj.addlistener('balanceChanged',@app.updateBalance);    % (4)
            
            app.updateBalance();
        end
        
    end

    % App initialization and construction
    methods (Access = private)
        function attatchToController(obj,controller)   % (5)
            funcH = @controller.callback_withDrawButton;
            addlistener(obj.WithdrawButton,'ButtonPushed',funcH)
            
            funcH = @controller.callback_depositButton;
            addlistener(obj.DepositButton,'ButtonPushed',funcH)
        end
        
        % Create UIFigure and components
        function createComponents(app)
            
            % Create BankUIFigure
            app.BankUIFigure = uifigure;
            app.BankUIFigure.Position = [100 100 640 480];
            app.BankUIFigure.Name = 'Bank';

            % Create WithdrowButton
            app.WithdrawButton = uibutton(app.BankUIFigure, 'push');
            app.WithdrawButton.Position = [191 238 66 22];
            app.WithdrawButton.Text = 'Withdraw';

            % Create BalanceEditFieldLabel
            app.BalanceEditFieldLabel = uilabel(app.BankUIFigure);
            app.BalanceEditFieldLabel.HorizontalAlignment = 'right';
            app.BalanceEditFieldLabel.Position = [198 329 50 15];
            app.BalanceEditFieldLabel.Text = 'Balance';

            % Create ViewBalance
            app.ViewBalance = uieditfield(app.BankUIFigure, 'numeric');
            app.ViewBalance.Position = [263 325 100 22];

            % Create RMBEditFieldLabel
            app.RMBEditFieldLabel = uilabel(app.BankUIFigure);
            app.RMBEditFieldLabel.HorizontalAlignment = 'right';
            app.RMBEditFieldLabel.Position = [216 284 32 15];
            app.RMBEditFieldLabel.Text = 'RMB';

            % Create ViewRMB
            app.ViewRMB = uieditfield(app.BankUIFigure, 'numeric');
            app.ViewRMB.Position = [263 280 100 22];

            % Create DepositeButton
            app.DepositButton = uibutton(app.BankUIFigure, 'push');
            app.DepositButton.Position = [299 238 64 22];
            app.DepositButton.Text = 'Deposit';
        end
    end

    methods (Access = public)

        % Construct app
        function app = View(modelObj)                 % (6)   
            app.modelObj = modelObj;                  % (6)  
            
            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.BankUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end
        
        
        function updateBalance(obj,src,data)           % [7]
            obj.ViewBalance.Value = obj.modelObj.balance;
        end
        
        
        
        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.BankUIFigure)
        end
    end
end
