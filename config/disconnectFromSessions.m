function disconnectFromSessions (conn)

% Check if the connection is open
    if isopen(conn)
        % Close the database connection
        close(conn);
        disp('Database connection successfully closed.');
    else
        disp('Database connection is already closed or failed to establish.');
    end

end
