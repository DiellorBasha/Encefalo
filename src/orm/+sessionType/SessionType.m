classdef (TableName = "session_types") SessionType < database.orm.mixin.Mappable & handle
    properties (PrimaryKey, ColumnName = "session_type_id")
        session_type_id int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "session_type_name")
        session_type_name string
    end

    methods
        function obj = SessionType(session_type_id, session_type_name)
            if nargin ~= 0
                inputElements = numel(session_type_id);
                if numel(session_type_name) ~= inputElements
                    error('All inputs must have the same number of elements');
                end
                
                % Initialize properties
                obj(inputElements).session_type_id = session_type_id(inputElements);
                obj(inputElements).session_type_name = session_type_name(inputElements);
                
                for n = 1:inputElements-1
                    obj(n).session_type_id = session_type_id(n);
                    obj(n).session_type_name = session_type_name(n);
                end
            end
        end
    end
end
