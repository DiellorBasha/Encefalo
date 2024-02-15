classdef (TableName = "roi_measurements") ROIMeasurements < database.orm.mixin.Mappable & handle
    properties (PrimaryKey, ColumnName = "roiMeasurementID")
        roiMeasurementID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "roiID")
        roiID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "roiMeasurementType")
        roiMeasurementType string
    end
    properties (ColumnName = "roiMeasurementValue")
        roiMeasurementValue double
    end
    properties (ColumnName = "units")
        units string
    end

     properties (ColumnName = "sessionID")
        sessionID int32
    end

    methods
        function obj = ROIMeasurements(roiMeasurementID, roiID, roiMeasurementType, roiMeasurementValue, units, sessionID)
            if nargin ~= 0
                inputElements = numel(roiMeasurementID);
                if numel(roiID) ~= inputElements || numel(roiMeasurementType) ~= inputElements || ...
                   numel(roiMeasurementValue) ~= inputElements || numel(units) ~= inputElements
                    error('All inputs must have the same number of elements');
                end
                
                % Initialize properties
                obj(inputElements).roiMeasurementID = roiMeasurementID(inputElements);
                obj(inputElements).roiID = roiID(inputElements);
                obj(inputElements).roiMeasurementType = roiMeasurementType(inputElements);
                obj(inputElements).roiMeasurementValue = roiMeasurementValue(inputElements);
                obj(inputElements).units = units(inputElements);
                obj(inputElements).sessionID = sessionID(inputElements);
                
                for n = 1:inputElements-1
                    obj(n).roiMeasurementID = roiMeasurementID(n);
                    obj(n).roiID = roiID(n);
                    obj(n).roiMeasurementType = roiMeasurementType(n);
                    obj(n).roiMeasurementValue = roiMeasurementValue(n);
                    obj(n).units = units(n);
                    obj(n).sessionID = sessionID(n);
                end
            end
        end
    end
end
