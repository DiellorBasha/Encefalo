% Example function to prepare data for survival analysis
function [durationsWithoutRipples, durationsWithRipples, DOWNDurations] = prepareSurvivalData(DOWNRois, DOWNDurations, roiMeasurementLabel)
    durationsWithoutRipples = [];
    durationsWithRipples = [];

    % Loop through DOWNRois to match and classify
    for i = 1:length(DOWNRois)
        % Find matching duration in DOWNDurations
        idx = find([DOWNDurations.roiID] == DOWNRois(i).roiID);
        if ~isempty(idx)
            if DOWNRois(i).Value == 0
                % Append to durationsWithoutRipples
                durationsWithoutRipples = [durationsWithoutRipples; DOWNDurations(idx).roiMeasurementValue];
                DOWNDurations(idx).roiMeasurementType = strcat(roiMeasurementLabel, '_DurationsWithoutRipples');
            elseif DOWNRois(i).Value > 0
                % Append to durationsWithRipples
                durationsWithRipples = [durationsWithRipples; DOWNDurations(idx).roiMeasurementValue];
                DOWNDurations(idx).roiMeasurementType = strcat(roiMeasurementLabel, '_DurationsWithRipples');
            end
        end
    end
end
