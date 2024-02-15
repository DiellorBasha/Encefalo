function conn = openDatabaseConnection()
    dbInstance = DBConnection.getInstance();
    conn = dbInstance.getConnection();
    if ~isopen(conn)
        error('Failed to establish a database connection.');
    end
    disp('Database connection successfully established.');
end
