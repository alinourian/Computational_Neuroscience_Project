function plotRaster(trials,offset,dt)
    spktimes = cell(1,length(trials(:,1)));
    hold on;
    for i=1:length(trials(:,1))
        t = zeros(1,sum(trials(i,:)));
        counter = 0;
        for j=1:length(trials(1,:))
            if(trials(i,j) == 1)
                counter = counter + 1;
                t(counter) = j*dt+offset;
            end
        end
        spktimes(1,i) = {t};
        spks = spktimes{i};
        t = repmat(spks,3,1);
        raster = nan(size(t));
        if ~isempty(raster)
            raster(1,:) = i - 1;
            raster(2,:) = i;
        end
        plot(t, raster, 'Color', 'k');
    end
    y = 0:length(trials(:,1));
    h = 0 .* y;
    plot(h,y,'b--','linewidth',2);
    ylabel('Trials','Interpreter','latex'); xlabel('Times(ms)','Interpreter','latex');
    hold off;
end