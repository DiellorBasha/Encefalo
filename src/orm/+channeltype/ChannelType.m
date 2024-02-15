classdef (TableName = "channel_types") ChannelType < database.orm.mixin.Mappable & handle
    properties (PrimaryKey, ColumnName = "channelTypeID")
        channelTypeID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "channelType")
        channelType string
    end

    methods
        function obj = ChannelType(channelTypeID, channelType)
            if nargin ~= 0
                inputElements = numel(channelTypeID);
                if numel(channelType) ~= inputElements
                    error('All inputs must have the same number of elements');
                end
                
                % Initialize properties
                obj(inputElements).channelTypeID = channelTypeID(inputElements);
                obj(inputElements).channelType = channelType(inputElements);
                
                for n = 1:inputElements-1
                    obj(n).channelTypeID = channelTypeID(n);
                    obj(n).channelType = channelType(n);
                end
            end
        end
    end
end
