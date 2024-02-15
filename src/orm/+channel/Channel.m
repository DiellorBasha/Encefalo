classdef (TableName = "channels") Channel < database.orm.mixin.Mappable
    properties (PrimaryKey, ColumnName = "channelID")
        channelID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "sessionID")
        sessionID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "channelName")
        channelName string
    end
    properties (ColumnName = "channelTypeID")
        channelTypeID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "brainRegionID")
        brainRegionID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "fs")
        fs double
    end
    properties (ColumnName = "numSamples")
        numSamples int32 {mustBeNonnegative, mustBeInteger}
    end

    methods
        function obj = Channel(channelID, sessionID, channelName, channelTypeID, brainRegionID, fs, numSamples)
            if nargin ~= 0
                inputElements = numel(channelID);
                if numel(sessionID) ~= inputElements || numel(channelName) ~= inputElements || ...
                        numel(channelTypeID) ~= inputElements || numel(brainRegionID) ~= inputElements || ...
                        numel(fs) ~= inputElements || numel(numSamples) ~= inputElements
                    error('All inputs must have the same number of elements');
                end

                obj(inputElements).channelID = channelID(inputElements);
                obj(inputElements).sessionID = sessionID(inputElements);
                obj(inputElements).channelName = channelName(inputElements);
                obj(inputElements).channelTypeID = channelTypeID(inputElements);
                obj(inputElements).brainRegionID = brainRegionID(inputElements);
                obj(inputElements).fs = fs(inputElements);
                obj(inputElements).numSamples = numSamples(inputElements);

                for n = 1:inputElements-1
                    obj(n).channelID = channelID(n);
                    obj(n).sessionID = sessionID(n);
                    obj(n).channelName = channelName(n);
                    obj(n).channelTypeID = channelTypeID(n);
                    obj(n).brainRegionID = brainRegionID(n);
                    obj(n).fs = fs(n);
                    obj(n).numSamples = numSamples(n);
                end
            end
        end
    end

    methods
      function obj = extractChannel(obj, ChannelName)
            
            
            % Use obj.filePath directly
            filestore = matlab.io.datastore.FileSet(obj.filePath);

            % Use obj.SignalVariableNames directly
            sds = signalDatastore(filestore, 'SignalVariableNames', ChannelName);

            reset(sds);
            [data, ~] = read(sds);

            % Update obj.data and obj.info
            dt = data.interval;
            fs = round(1/dt);
            name = data.title;
            units = 'mV';
            signal = double(data.values);
            numSamples = data.length;
            type = 'LFP';

            obj.channel = Channel(name, fs, 'mV', signal);  % construct a channel
      end
    end
end
