function BeamListScPlot(centerList,w,h,center,pixelSize,beamSize,beamIntensity)

    arguments
        centerList (:,2) double
        w = 2048;
        h = 2048;
        center = [w/2, h/2];
        pixelSize = 15e-6;
        beamSize = 300e-6;
        beamIntensity = 100;
    end

    img = zeros(h,w);
    NCenter = size(centerList,1);

    for j=1:w
        for i=1:h
            x = (j-center(1)) * pixelSize;
            y = (i-center(2)) * pixelSize;

            for a=1:NCenter
                c = centerList(a,:);
                img(i,j) = img(i,j) + beamIntensity*exp(-(2/beamSize^2)*((x-c(1))^2 + (y-c(2))^2));
            end

        end
    end

    imagesc(img);
    colormap jet;
    axis equal;
end