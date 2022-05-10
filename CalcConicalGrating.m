function Delta = CalcConicalGrating(m, d, Lambda, Gamma, Alpha, L, CenteratConeTop, Rotation)
    arguments
       m
       d
       Lambda
       Gamma
       Alpha
       L
       CenteratConeTop = false;
       Rotation = 0; % Rotation in Degrees
    end

    [~, ~, ~, ~, ~, Beta] = CalcConicalGratingFormula(m, Lambda, d, Gamma, Alpha, missing);
    DeltaX = L * tan(Gamma) * sin(Beta);
    if CenteratConeTop
        DeltaY = L * tan(Gamma) * (-cos(Beta) + 1);
    else
        DeltaY = L * tan(Gamma) * (-cos(Beta));
    end
    
    Rt = deg2rad(Rotation);
    R = [cos(Rt) -sin(Rt); sin(Rt) cos(Rt)];

    Delta = R * [DeltaX; DeltaY];
end

