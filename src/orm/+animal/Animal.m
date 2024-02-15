classdef (TableName = "animals") Animal < database.orm.mixin.Mappable & handle
    properties (PrimaryKey, ColumnName = "animalID")
        animalID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "name")
        name string
    end
    properties (ColumnName = "sex")
        sex string
    end
    properties (ColumnName = "species")
        species string
    end
    properties (ColumnName = "strain")
        strain string
    end

    methods
        function obj = Animal(animalID, name, sex, species, strain)
            if nargin ~= 0
                inputElements = numel(animalID);
                if numel(name) ~= inputElements || numel(sex) ~= inputElements || ...
                        numel(species) ~= inputElements || numel(strain) ~= inputElements
                    error('All inputs must have the same number of elements');
                end

                obj(inputElements).animalID = animalID(inputElements);
                obj(inputElements).name = name(inputElements);
                obj(inputElements).sex = sex(inputElements);
                obj(inputElements).species = species(inputElements);
                obj(inputElements).strain = strain(inputElements);

                for n = 1:inputElements-1
                    obj(n).animalID = animalID(n);
                    obj(n).name = name(n);
                    obj(n).sex = sex(n);
                    obj(n).species = species(n);
                    obj(n).strain = strain(n);
                end
            end
        end
    end
end
