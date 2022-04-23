function BeamListScPlot(ax, centerList,w,h,pixelSize,beamSize,beamIntensity,center)

    arguments
        ax
        centerList (:,2) double
        w = 2048;
        h = 2048;
        pixelSize = 15e-6;
        beamSize = 300e-6;
        beamIntensity (:,1) double = 100;
        center = [w/2, h/2];
    end

    img = zeros(h,w);
    NCenter = size(centerList,1);

    if size(beamIntensity,1) == 1
        beamIntensity = ones(NCenter,1)*beamIntensity(1);
    end

    for j=1:w
        for i=1:h
            x = (j-center(1)) * pixelSize;
            y = (i-center(2)) * pixelSize;

            for a=1:NCenter
                c = centerList(a,:);
                img(i,j) = img(i,j) + beamIntensity(a)*exp(-(2/beamSize^2)*((x-c(1))^2 + (y-c(2))^2));
            end

        end
    end
    
    imagesc(ax, img);
    colormap(ax, 'jet');
    axis(ax, 'equal');
end