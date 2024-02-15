classdef (TableName = "histology") Histology < database.orm.mixin.Mappable & handle
    properties (PrimaryKey, ColumnName = "histologyID")
        histologyID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "sessionID")
        sessionID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "brainRegionID")
        brainRegionID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "abbreviation_Name")
        abbreviation_Name string
    end
    properties (ColumnName = "section")
        section string
    end
    properties (ColumnName = "imageDirectory")
        imageDirectory string
    end
    properties (ColumnName = "stainType")
        stainType string
    end
    properties (ColumnName = "sectionThickness")
        sectionThickness int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "ROI")
        ROI string
    end
    properties (ColumnName = "findings")
        findings string
    end
    properties (ColumnName = "microscope")
        microscope string
    end
    properties (ColumnName = "magnification")
        magnification int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "imageFilePath")
        imageFilePath string
    end

    methods
        function obj = Histology(histologyID, sessionID, brainRegionID, abbreviation_Name, section, imageDirectory, stainType, sectionThickness, ROI, findings, microscope, magnification, imageFilePath)
            if nargin ~= 0
                inputElements = numel(histologyID);
                % Check that all inputs have the same number of elements
                if numel(sessionID) ~= inputElements || numel(brainRegionID) ~= inputElements || ...
                   numel(abbreviation_Name) ~= inputElements || numel(section) ~= inputElements || ...
                   numel(imageDirectory) ~= inputElements || numel(stainType) ~= inputElements || ...
                   numel(sectionThickness) ~= inputElements || numel(ROI) ~= inputElements || ...
                   numel(findings) ~= inputElements || numel(microscope) ~= inputElements || ...
                   numel(magnification) ~= inputElements || numel(imageFilePath) ~= inputElements
                    error('All inputs must have the same number of elements');
                end
                
                % Initialize properties
                obj(inputElements).histologyID = histologyID(inputElements);
                obj(inputElements).sessionID = sessionID(inputElements);
                obj(inputElements).brainRegionID = brainRegionID(inputElements);
                obj(inputElements).abbreviation_Name = abbreviation_Name(inputElements);
                obj(inputElements).section = section(inputElements);
                obj(inputElements).imageDirectory = imageDirectory(inputElements);
                obj(inputElements).stainType = stainType(inputElements);
                obj(inputElements).sectionThickness = sectionThickness(inputElements);
                obj(inputElements).ROI = ROI(inputElements);
                obj(inputElements).findings = findings(inputElements);
                obj(inputElements).microscope = microscope(inputElements);
                obj(inputElements).magnification = magnification(inputElements);
                obj(inputElements).imageFilePath = imageFilePath(inputElements);
                
                for n = 1:inputElements-1
                    obj(n).histologyID = histologyID(n);
                    obj(n).sessionID = sessionID(n);
                    obj(n).brainRegionID = brainRegionID(n);
                    obj(n).abbreviation_Name = abbreviation_Name(n);
                    obj(n).section = section(n);
                    obj(n).imageDirectory = imageDirectory(n);
                    obj(n).stainType = stainType(n);
                    obj(n).sectionThickness = sectionThickness(n);
                    obj(n).ROI = ROI(n);
                    obj(n).findings = findings(n);
                    obj(n).microscope = microscope(n);
                    obj(n).magnification = magnification(n);
                    obj(n).imageFilePath = imageFilePath(n);
                end
            end
        end
    end
end
