classdef Test1 < matlab.unittest.TestCase
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        OriginalPath;
    end
    
    methods (TestMethodSetup)
        function addSolverToPath(testCase)
            testCase.OriginalPath = path;
            addpath(fullfile(pwd,'code_to_test'))
        end
    end
    
   methods (TestMethodTeardown)
        function restorePath(testCase)
            path(testCase.OriginalPath);
        end
    end
    
    methods (Test)
        function testRealsolution(testCase)
            actSolution = 1;
            expSolution =2;
            testCase.verifyEqual(actSolution,expSolution,'AbsTol',sqrt(eps));
        end
        
        function testImaginarySolution(testCase)
            actSolution = 1;
            expSolution =2;
            testCase.verifyEqual(actSolution,expSolution,'AbsTol',sqrt(eps));
        end
        
    end
    
end

