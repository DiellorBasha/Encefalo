classdef (TableName = "roi_type") ROIType < database.orm.mixin.Mappable & handle
    properties (PrimaryKey, ColumnName = "ROITypeID")
        ROITypeID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "ROITypeName")
        ROITypeName string
    end
    properties (ColumnName = "sessionID")
        sessionID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "channelID")
        channelID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "filterType")
        filterType string
    end
    properties (ColumnName = "filterLowFrequency")
        filterLowFrequency double
    end
    properties (ColumnName = "filterHighFrequency")
        filterHighFrequency double
    end
    properties (ColumnName = "posThreshold")
        posThreshold double
    end
    properties (ColumnName = "negThreshold")
        negThreshold double
    end
    properties (ColumnName = "RMSTau")
        RMSTau double
    end
    properties (ColumnName = "smoothTau")
        smoothTau double
    end
    properties (ColumnName = "minDuration")
        minDuration double
    end
    properties (ColumnName = "maxDuration")
        maxDuration double
    end
    properties (ColumnName = "peakHeight")
        peakHeight double
    end
    properties (ColumnName = "peakProminence")
        peakProminence double
    end
    properties (ColumnName = "minSeparation")
        minSeparation double
    end
    properties (ColumnName = "searchWindow")
        searchWindow double
    end
    properties (ColumnName = "detectionAlgorithm")
        detectionAlgorithm string
    end
    properties (ColumnName = "referenceDOI")
        referenceDOI string
    end

    methods
        function obj = ROIType(ROITypeID, ROITypeName, sessionID, channelID, filterType, filterLowFrequency, filterHighFrequency, posThreshold, negThreshold, RMSTau, smoothTau, minDuration, maxDuration, peakHeight, peakProminence, minSeparation, searchWindow, detectionAlgorithm, referenceDOI)
            if nargin ~= 0
                inputElements = numel(ROITypeID);
                % Add checks here to ensure all inputs have the same number of elements
                obj(inputElements).ROITypeID = ROITypeID(inputElements);
                obj(inputElements).ROITypeName = ROITypeName(inputElements);
                obj(inputElements).sessionID = sessionID(inputElements);
                obj(inputElements).channelID = channelID(inputElements);
                obj(inputElements).filterType = filterType(inputElements);
                obj(inputElements).filterLowFrequency = filterLowFrequency(inputElements);
                obj(inputElements).filterHighFrequency = filterHighFrequency(inputElements);
                obj(inputElements).posThreshold = posThreshold(inputElements);
                obj(inputElements).negThreshold = negThreshold(inputElements);
                obj(inputElements).RMSTau = RMSTau(inputElements);
                obj(inputElements).smoothTau = smoothTau(inputElements);
                obj(inputElements).minDuration = minDuration(inputElements);
                obj(inputElements).maxDuration = maxDuration(inputElements);
                obj(inputElements).peakHeight = peakHeight(inputElements);
                obj(inputElements).peakProminence = peakProminence(inputElements);
                obj(inputElements).minSeparation = minSeparation(inputElements);
                obj(inputElements).searchWindow = searchWindow(inputElements);
                obj(inputElements).detectionAlgorithm = detectionAlgorithm(inputElements);
                obj(inputElements).referenceDOI = referenceDOI(inputElements);
                
                for n = 1:inputElements-1
                    % Initialize remaining properties for each object in the array
                end
            end
        end
    end
end
