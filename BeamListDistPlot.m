function BeamListDistPlot(ax,centerList, sampleCord, sampleDim, w,h, pixelSize,beamSize,beamIntensity,center)
    arguments
        ax
        centerList (:,2) double
        sampleCord = 0;
        sampleDim = 1;
        w = 2048;
        h = 2048;
        pixelSize = 15e-6;
        beamSize = 300e-6;
        beamIntensity (:,1) double = 100;
        center = [w/2, h/2];
    end

    if sampleDim == 1
        sampleSpace = linspace(1,w,w);
        samples = zeros(w,1);
        sampleOffsetDim = 2;
    elseif sampleDim == 2
        sampleSpace = linspace(1,h,h);
        samples = zeros(h,1);
        sampleOffsetDim = 1;
    end


    NCenter = size(centerList,1);

    if size(beamIntensity,1) == 1
        beamIntensity = ones(NCenter,1)*beamIntensity(1);
    end

    for a=1:NCenter
        c = centerList(a,:);
        for i = sampleSpace
            x = (i-center(sampleDim)) * pixelSize;
            y = (sampleCord - center(sampleOffsetDim)) * pixelSize;
            samples(i) = samples(i) + beamIntensity(a)*exp(-(2/beamSize^2)*((x-c(sampleDim))^2 + (y-c(sampleOffsetDim))^2));
        end
    end
    
    plot(ax, sampleSpace, samples);
    xlim(ax,[0,size(sampleSpace,2)]);
end