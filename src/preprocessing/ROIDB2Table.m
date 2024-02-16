function ROITable = ROIDB2Table (rois)
% Extract ROILimits_1, ROILimits_2, and Value
% input must be an array of ROIDB objects
ROILimits_1 = arrayfun(@(x) x.ROILimits_1, rois);
ROILimits_2 = arrayfun(@(x) x.ROILimits_2, rois);
Value = arrayfun(@(x) x.Value, rois);

% Combine ROILimits_1 and ROILimits_2 into a single matrix
ROILimits = [ROILimits_1, ROILimits_2];

% Convert Value to categorical
ValueCategorical = categorical(Value);

% Create the table
ROITable = table(ROILimits, ValueCategorical, 'VariableNames', {'ROILimits', 'Value'});
end
