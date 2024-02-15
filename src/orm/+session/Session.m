classdef (TableName = "sessions") Session < database.orm.mixin.Mappable
    properties (PrimaryKey, ColumnName = "sessionID")
        sessionID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "animalID")
        animalID int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "name")
        name string
    end
    properties (ColumnName = "projects")
        projects string
    end
    properties (ColumnName = "date")
        date datetime
    end
    properties (ColumnName = "time")
        time datetime
    end
    properties (ColumnName = "duration")
        duration double
    end
    properties (ColumnName = "depth")
        depth string
    end
    properties (ColumnName = "folderpath")
        folderpath string
    end
    properties (ColumnName = "notes")
        notes string
    end
    properties (ColumnName = "fileFormat")
        fileFormat string
    end
    properties (ColumnName = "location")
        location string
    end
    properties (ColumnName = "investigator")
        investigator string
    end
    properties (ColumnName = "session_type_id")
        session_type_id int32 {mustBeNonnegative, mustBeInteger}
    end
    properties (ColumnName = "recordingFilePath")
        recordingFilePath string
    end
    properties (ColumnName = "histologyID")
        histologyID int32 {mustBeNonnegative, mustBeInteger}
    end

     properties (ExcludeFromDatabase) % Transient; it is not mapped to any database column
        Channels
     end

    methods
        function obj = Session(sessionID, animalID, name, projects, date, time, duration, depth, folderpath, notes, fileFormat, location, investigator, session_type_id, recordingFilePath, histologyID)
            if nargin ~= 0
                inputElements = numel(sessionID);
                if numel(animalID) ~= inputElements || numel(name) ~= inputElements || ...
                        numel(projects) ~= inputElements || numel(date) ~= inputElements || ...
                        numel(time) ~= inputElements || numel(duration) ~= inputElements || ...
                        numel(depth) ~= inputElements || numel(folderpath) ~= inputElements || ...
                        numel(notes) ~= inputElements || numel(fileFormat) ~= inputElements || ...
                        numel(location) ~= inputElements || numel(investigator) ~= inputElements || ...
                        numel(session_type_id) ~= inputElements || numel(recordingFilePath) ~= inputElements || ...
                        numel(histologyID) ~= inputElements
                    error('All inputs must have the same number of elements');
                end

                obj(inputElements).sessionID = sessionID(inputElements);
                obj(inputElements).animalID = animalID(inputElements);
                obj(inputElements).name = name(inputElements);
                obj(inputElements).projects = projects(inputElements);
                obj(inputElements).date = date(inputElements);
                obj(inputElements).time = time(inputElements);
                obj(inputElements).duration = duration(inputElements);
                obj(inputElements).depth = depth(inputElements);
                obj(inputElements).folderpath = folderpath(inputElements);
                obj(inputElements).notes = notes(inputElements);
                obj(inputElements).fileFormat = fileFormat(inputElements);
                obj(inputElements).location = location(inputElements);
                obj(inputElements).investigator = investigator(inputElements);
                obj(inputElements).session_type_id = session_type_id(inputElements);
                obj(inputElements).recordingFilePath = recordingFilePath(inputElements);
                obj(inputElements).histologyID = histologyID(inputElements);

                for n = 1:inputElements-1
                    obj(n).sessionID = sessionID(n);
                    obj(n).animalID = animalID(n);
                    obj(n).name = name(n);
                    obj(n).projects = projects(n);
                    obj(n).date = date(n);
                    obj(n).time = time(n);
                    obj(n).duration = duration(n);
                    obj(n).depth = depth(n);
                    obj(n).folderpath = folderpath(n);
                    obj(n).notes = notes(n);
                    obj(n).fileFormat = fileFormat(n);
                    obj(n).location = location(n);
                    obj(n).investigator = investigator(n);
                    obj(n).session_type_id = session_type_id(n);
                    obj(n).recordingFilePath = recordingFilePath(n);
                    obj(n).histologyID = histologyID(n);
                end
            end
        end
    end

    methods
        % Method to load associated channels from the database
        function obj = loadChannels(obj, conn)
            if isempty(obj.sessionID)
                warning('Session ID is empty. Cannot load channels.');
                return;
            end

            % Assuming 'session.Channel' is the fully qualified name of your Channel ORM class
            rf = rowfilter("sessionID");
            rf = rf.sessionID == obj.sessionID;
            obj.Channels = ormread(conn, 'channel.Channel', RowFilter = rf);
        end
    end
end
