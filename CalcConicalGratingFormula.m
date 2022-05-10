function [m, Lambda, d, Gamma, Alpha, Beta] = CalcConicalGratingFormula(m, Lambda, d, Gamma, Alpha, Beta)
    % d*sin(Gamma)*(sin(Alpha)+sin(Beta)) = m*Lambda
    
    if ismissing(m)
        m = d * sin(Gamma) * (sin(Alpha) + sin(Beta)) / Lambda;
    end
    
    if ismissing(Lambda)
        Lambda = d * sin(Gamma) * (sin(Alpha) + sin(Beta)) / m;
    end

    if ismissing(d)
        d = m * Lambda / (sin(Gamma) * (sin(Alpha) + sin(Beta)));
    end

    if ismissing(Gamma)
        Gamma = asin(m * Lambda / (d * (sin(Alpha) + sin(Beta))));
    end

    if ismissing(Alpha)
        Alpha = asin(m * Lambda / (d * sin(Gamma)) - sin(Beta));
    end

    if ismissing(Beta)
        Beta = asin(m * Lambda / (d * sin(Gamma)) - sin(Alpha));
    end
    
end