function conn = connectToSessions

conn = database('sessionDatabase','root','Prizren1!');

% Check the connection
if isopen(conn)
    disp('Database connection successfully established.');
else
    disp('Failed to establish database connection.');
    disp(conn.Message);
    return;
end

data = sqlfind(conn,"",'Catalog',"sessions_db");
head(data)

end