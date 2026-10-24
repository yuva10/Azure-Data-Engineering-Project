USE gold_db
GO

CREATE OR ALTER PROCEDURE createSQLserver1essview_go1d @ViewName NVARCHAR(100)
AS
BEGIN

DECLARE @statement NVARCHAR(MAX)
        SET @statement =  N'CREATE OR ALTER VIEW ' +  @ViewName + N' AS
          SELECT *
          FROM OPENROWSET(
              BULK ''https://<Azure-data-lake>.blob.core.windows.net/gold/SalesLT/' + @ViewName + '/' + @ViewName + '/'',
              FORMAT = ''DELTA'' 
           ) AS [result]'

EXEC (@statement)

END