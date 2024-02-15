classdef (TableName = "brain_regions") BrainRegions < database.orm.mixin.Mappable & handle
    properties (PrimaryKey, ColumnName = "brainRegionID")
        brainRegionID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "brainRegion")
        brainRegion string
    end
    properties (ColumnName = "brainRegionAbbreviation")
        brainRegionAbbreviation string
    end
    properties (ColumnName = "x")
        x int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "y")
        y int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "z")
        z int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "abbreviation_Name")
        abbreviation_Name string
    end
    properties (ColumnName = "link")
        link string
    end

    methods
        function obj = BrainRegion(brainRegionID, brainRegion, brainRegionAbbreviation, x, y, z, abbreviation_Name, link)
            if nargin ~= 0
                inputElements = numel(brainRegionID);
                if numel(brainRegion) ~= inputElements || numel(brainRegionAbbreviation) ~= inputElements || ...
                   numel(x) ~= inputElements || numel(y) ~= inputElements || ...
                   numel(z) ~= inputElements || numel(abbreviation_Name) ~= inputElements || ...
                   numel(link) ~= inputElements
                    error('All inputs must have the same number of elements');
                end
                
                obj(inputElements).brainRegionID = brainRegionID(inputElements);
                obj(inputElements).brainRegion = brainRegion(inputElements);
                obj(inputElements).brainRegionAbbreviation = brainRegionAbbreviation(inputElements);
                obj(inputElements).x = x(inputElements);
                obj(inputElements).y = y(inputElements);
                obj(inputElements).z = z(inputElements);
                obj(inputElements).abbreviation_Name = abbreviation_Name(inputElements);
                obj(inputElements).link = link(inputElements);
                
                for n = 1:inputElements-1
                    obj(n).brainRegionID = brainRegionID(n);
                    obj(n).brainRegion = brainRegion(n);
                    obj(n).brainRegionAbbreviation = brainRegionAbbreviation(n);
                    obj(n).x = x(n);
                    obj(n).y = y(n);
                    obj(n).z = z(n);
                    obj(n).abbreviation_Name = abbreviation_Name(n);
                    obj(n).link = link(n);
                end
            end
        end
    end
end
