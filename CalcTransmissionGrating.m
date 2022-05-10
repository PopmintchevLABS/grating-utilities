function [Delta, Intensity] = CalcTransmissionGrating(m_x, m_y, d_x, d_y, Lambda, L, IntensityProfile, NGrating_x, NGrating_y, OSRatio_x, OSRatio_y)
    arguments
        m_x
        m_y
        d_x
        d_y
        Lambda
        L
        IntensityProfile = "Uniform";
        NGrating_x = 1;
        NGrating_y = 1;
        OSRatio_x = 1;
        OSRatio_y = 1;
    end

    Delta = zeros(1,2);
    Intensity = 1;
    if m_x == 0
        Intensity = Intensity * NGrating_x^2;
    else
        [~, ~, ~, Theta] = CalcGratingFormula(m_x, Lambda, d_x, 0);
        Delta(1) = tan(Theta) * L;
        delta = 2 * pi * d_x * sin(Theta) / Lambda;
        a_x = delta / (OSRatio_x + 1);
        cosL = zeros(NGrating_x, 1);
        for k = 1:NGrating_x
            cosL(k) = cos((2*k-1)*delta);
        end
        Intensity = Intensity * (sin(a_x/2)^2 / (a_x/2)^2) * (sum(cosL))^2;
    end
    
    if m_y == 0
        Intensity = Intensity * NGrating_y^2;
    else
        [~, ~, ~, Theta] = CalcGratingFormula(m_y, Lambda, d_y, 0);
        Delta(2) = tan(Theta) * L;
        delta = 2 * pi * d_y * sin(Theta) / Lambda;
        a_y = delta / (OSRatio_y + 1);
        cosL = zeros(NGrating_y, 1);
        for k = 1:NGrating_y
            cosL(k) = cos((2*k-1)*delta);
        end
        Intensity = Intensity * (sin(a_y/2)^2 / (a_y/2)^2) * (sum(cosL))^2;
    end

    if IntensityProfile == "Uniform"
        Intensity = 100;
    end
    
end