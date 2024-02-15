classdef DBConnection
    properties (Access = private)
        Connection % The database connection object
    end
    methods (Access = private)
        % Private constructor
        function obj = DBConnection()
            % Initialize the database connection here
            obj.Connection = database('sessionDatabase', 'root', 'Prizren1!');
            % Check if connection was successful
            if ~isempty(obj.Connection.Message)
                error(['Failed to connect to database: ', obj.Connection.Message]);
            end
        end
    end
    methods (Access = private)
        % Private method to actually create or verify the connection
        function createConnection(obj)
            if isempty(obj.Connection) || ~isempty(obj.Connection.Message)
                % Attempt to re-establish the connection if it's not valid
                obj.Connection = database('sessionDatabase', 'root', 'Prizren1!');
                if ~isempty(obj.Connection.Message)
                    error(['Failed to reconnect to database: ', obj.Connection.Message]);
                end
            end
        end
    end
    methods (Static)
        function obj = getInstance()
            persistent uniqueInstance;
            if isempty(uniqueInstance)
                uniqueInstance = DBConnection();
            else
                % Ensure the connection is still valid
                uniqueInstance.createConnection();
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
            if ~isempty(obj.Connection)
                close(obj.Connection);
                obj.Connection = []; % Clear the connection object
            end
        end
    end
end
