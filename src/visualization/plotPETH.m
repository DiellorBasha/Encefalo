function plotPETH(time, PETH, saveFig, figFormat)
%PLOTPETH Generates a peri-event time histogram (PETH) plot.
%   plotPETH(time, PETH, saveFig, figFormat) plots the PETH given time and
%   PETH data. If saveFig is true, saves the figure in the specified format.

if nargin < 3
    saveFig = false; % Default is not to save
end
if nargin < 4
    figFormat = '-dpng'; % Default format
end

hfig = figure;
plot(time, PETH, 'k-', 'LineWidth', 1.5);
xlabel('Time to event onset (s)');
ylabel('Rate (Hz)');
title('Peri-event time histogram');

fontName = 'Arial';

% Aesthetics
set(gca, 'FontSize', 14, 'Box', 'off', 'FontName', fontName);
set(findall(hfig, '-property', 'FontName'), 'FontName', fontName);
set(hfig, 'Units', 'centimeters');
picturewidth = 20;
hw_ratio = 0.65;
figPos = [3 3 picturewidth hw_ratio*picturewidth];
set(hfig, 'Position', figPos);

% Adjust paper settings for saving
set(hfig, 'PaperPositionMode', 'Auto', 'PaperUnits', 'centimeters', 'PaperSize', [figPos(3), figPos(4)]);

% Optionally save the figure
if saveFig
    fname = ['myfigure', '.', figFormat(3:end)]; % Construct filename
    print(hfig, fname, figFormat, '-painters');
    if strcmp(figFormat, '-dpdf')
        print(hfig, fname, figFormat, '-painters', '-fillpage');
    else
        print(hfig, fname, figFormat, '-painters');
    end
end

end
