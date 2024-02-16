function plotSurvivalCurves(durationsWithoutRipples, durationsWithRipples, sessionID)
    % Calculate the empirical CDF for both groups
    [fWithoutRipples, xWithoutRipples] = ecdf(durationsWithoutRipples);
    [fWithRipples, xWithRipples] = ecdf(durationsWithRipples);
    
    % Convert to survival curves
    sWithoutRipples = 1 - fWithoutRipples;
    sWithRipples = 1 - fWithRipples;
    
    % Plot
    figure;
    plot(xWithoutRipples, sWithoutRipples, 'b-', 'LineWidth', 2);
    hold on;
    plot(xWithRipples, sWithRipples, 'r-', 'LineWidth', 2);
    xlabel('Duration (units)');
    ylabel('Survival Probability');
    legend('Without Ripples', 'With Ripples');
    title(sprintf('Survival Curves for DOWN States, Session: %d', sessionID));
    hold off;
end
