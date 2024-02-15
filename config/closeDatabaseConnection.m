function closeDatabaseConnection()
    dbInstance = DBConnection.getInstance();
    dbInstance.closeConnection();
    disp('Database connection successfully closed.');
end
