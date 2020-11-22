classdef zController < matlab.System
    % Untitled Add summary here
    %
    % This template includes the minimum set of functions required
    % to define a System object with discrete state.

    % Public, tunable properties
    properties

    end

    properties(DiscreteState)

    end

    % Pre-computed constants
    properties(Access = private)

    end

    methods(Access = protected)
        function setupImpl(obj)
            % Perform one-time calculations, such as computing constants
        end

        function [control] = stepImpl(obj, state)
            % Implement algorithm. Calculate y as a function of input u and
            % discrete states.
            kp = 0.6;
            kd = 0.2;
            
            control.u1 = kp * (1 - state.q(1)) + kd * (0 - state.dq(1));
            control.u2 = kp * (0 - state.q(2)) + kd * (0 - state.dq(2));
        end

        function resetImpl(obj)
            % Initialize / reset discrete-state properties
        end
        
        function [out] = getOutputDataTypeImpl(~)
            %GETOUTPUTDATATYPEIMPL Get data types of output ports.
            out = 'control';
        end % getOutputDataTypeImpl
        
    end
end
