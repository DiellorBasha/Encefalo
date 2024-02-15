classdef DBConnection
    properties (Access = private)
        Connection % The database connection object
    end
    methods (Access = private)
        % Private constructor
        function obj = DBConnection()
            % Initialize the database connection here
           obj.Connection = database('sessionDatabase','root','Prizren1!');
            % Adjust the parameters according to your database
        end
    end
    methods (Access = private)
        % Private method to actually create the connection
        function createConnection(obj)
            if isempty(obj.Connection) || ~isopen(obj.Connection)
                % Re-establish the connection if it's empty or invalid
                obj.Connection = database('sessionDatabase','root','Prizren1!'); % Fill in your connection details
            end
        end
    end
   methods (Static)
    function obj = getInstance()
        persistent uniqueInstance;
        if isempty(uniqueInstance)
            uniqueInstance = DBConnection();
        else
            % Since uniqueInstance already exists, ensure the connection is still open
            uniqueInstance.createConnection(); % This will re-establish the connection if it's not open
        end
        obj = uniqueInstance;
    end
end

    methods
        % Method to get the connection object
        function conn = getConnection(obj)
            conn = obj.Connection;
        end
        
        % Method to close the connection
        function closeConnection(obj)
            if ~isempty(obj.Connection) && isopen(obj.Connection)
                close(obj.Connection);
                obj.Connection = []; % Clear the connection object
            end
        end
    end
end
