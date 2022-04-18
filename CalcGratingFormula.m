function [m, Lambda, d, Theta] = CalcGratingFormula(m, Lambda, d, Theta)
    % d*sin(Theta) = m*Lambda
    
    if m == 0
        m = d * sin(Theta) / Lambda;
    end
    
    if Lambda == 0
        Lambda = d * sin(Theta) / m;
    end

    if d == 0
        d = m * Lambda / sin(Theta);
    end

    if Theta == 0
        Theta = asin(m * Lambda / d);
    end
    
end