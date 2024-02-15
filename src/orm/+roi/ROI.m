classdef (TableName = "roi") ROI < database.orm.mixin.Mappable & handle
    properties (PrimaryKey, ColumnName = "roiID")
        roiID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "ROILimits_1")
        ROILimits_1 double
    end
    properties (ColumnName = "ROILimits_2")
        ROILimits_2 double
    end
    properties (ColumnName = "Value")
        Value int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "ROIType")
        ROIType string
    end
    properties (ColumnName = "sessionID")
        sessionID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "ROITypeID")
        ROITypeID int32 {mustBeNonnegative, mustBeInteger}
    end

    methods
        function obj = ROI(roiID, ROILimits_1, ROILimits_2, Value, ROIType, sessionID, ROITypeID)
            if nargin ~= 0
                inputElements = numel(roiID);
                if numel(ROILimits_1) ~= inputElements || numel(ROILimits_2) ~= inputElements || ...
                   numel(Value) ~= inputElements || numel(ROIType) ~= inputElements || ...
                   numel(sessionID) ~= inputElements || numel(ROITypeID) ~= inputElements
                    error('All inputs must have the same number of elements');
                end
                
                % Initialize properties
                obj(inputElements).roiID = roiID(inputElements);
                obj(inputElements).ROILimits_1 = ROILimits_1(inputElements);
                obj(inputElements).ROILimits_2 = ROILimits_2(inputElements);
                obj(inputElements).Value = Value(inputElements);
                obj(inputElements).ROIType = ROIType(inputElements);
                obj(inputElements).sessionID = sessionID(inputElements);
                obj(inputElements).ROITypeID = ROITypeID(inputElements);
                
                for n = 1:inputElements-1
                    obj(n).roiID = roiID(n);
                    obj(n).ROILimits_1 = ROILimits_1(n);
                    obj(n).ROILimits_2 = ROILimits_2(n);
                    obj(n).Value = Value(n);
                    obj(n).ROIType = ROIType(n);
                    obj(n).sessionID = sessionID(n);
                    obj(n).ROITypeID = ROITypeID(n);
                end
            end
        end
    end
end
