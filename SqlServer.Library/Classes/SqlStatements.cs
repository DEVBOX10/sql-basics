﻿using SqlServer.Library.Models;

namespace SqlServer.Library.Classes;

/// <summary>
/// All SQL statements for the program.
/// </summary>
/// <remarks>
/// Some might want to place these statements into stored procedures but that means
/// the database would have to be modified. This way the database is not modified. Also,
/// the developer will need permissions to create the stored procedures.
/// </remarks>
internal class SqlStatements
{
    /// <summary>
    /// Used to return all foreign keys with rules for a database
    /// </summary>
    public static string GetForeignKeysWithRules = 
        """
        SELECT
            PK.TABLE_NAME AS TableName,
            C.CONSTRAINT_NAME AS ConstraintName,
            CCU.COLUMN_NAME AS ColumnName,
            FK.TABLE_NAME AS ForeignTableName,
            CU.COLUMN_NAME AS ForeignColumnName,
            C.UPDATE_RULE AS UpdateRule,
            C.DELETE_RULE AS DeleteRule
        FROM
            INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS C INNER JOIN
            INFORMATION_SCHEMA.TABLE_CONSTRAINTS FK ON C.CONSTRAINT_NAME = FK.CONSTRAINT_NAME INNER JOIN
            INFORMATION_SCHEMA.TABLE_CONSTRAINTS PK ON C.UNIQUE_CONSTRAINT_NAME = PK.CONSTRAINT_NAME INNER JOIN
            INFORMATION_SCHEMA.KEY_COLUMN_USAGE CU ON C.CONSTRAINT_NAME = CU.CONSTRAINT_NAME INNER JOIN
            INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE CCU ON PK.CONSTRAINT_NAME = CCU.CONSTRAINT_NAME
        WHERE
            ((C.UPDATE_RULE = 'CASCADE') OR (C.DELETE_RULE = 'CASCADE')) AND
            (FK.CONSTRAINT_TYPE = 'FOREIGN KEY')
        ORDER BY
            PK.TABLE_NAME, 
            FK.TABLE_NAME;
        """;

    /// <summary>
    /// Get all views for a database into a list of <see cref="ViewContainer"/>
    /// </summary>
    public const string GetViewsStatement = 
        """
        SELECT 
          SCHEMA_NAME(schema_id) AS [Schema],
          [Name]
        FROM sys.views;
        """;

    /// <summary>
    /// Get all tables for a database and database name into a list of <see cref="DataContainer"/>
    /// </summary>
    public const string GetDatabasesStatement =
        """
        DECLARE @sql NVARCHAR(MAX);
        
        SELECT @sql
            = (   SELECT ' UNION ALL
                SELECT ' +    +QUOTENAME(name, '''')
                         + ' as DatabaseName,
                       s.name COLLATE DATABASE_DEFAULT
                            AS SchemaName,
                       t.name COLLATE DATABASE_DEFAULT as TableName 
                       FROM ' + QUOTENAME(name) + '.sys.tables t
                       JOIN ' + QUOTENAME(name) + '.sys.schemas s
                            on s.schema_id = t.schema_id'
                    FROM sys.databases
                   WHERE state = 0
                   ORDER BY [name]
                  FOR XML PATH(''), TYPE).value('.', 'nvarchar(max)');
        
        SET @sql
            = STUFF(@sql, 1, 12, '')
              + N' order by DatabaseName, 
                                                       SchemaName,
                                                       TableName';
        
        EXECUTE (@sql);
        """;

    public const string GetDatabaseStatement =
        """
        DECLARE @sql NVARCHAR(MAX);

        SELECT @sql
            = (   SELECT ' UNION ALL
                SELECT ' +    +QUOTENAME(name, '''')
                         + ' as DatabaseName,
                       s.name COLLATE DATABASE_DEFAULT
                            AS SchemaName,
                       t.name COLLATE DATABASE_DEFAULT as TableName 
                       FROM ' + QUOTENAME(name) + '.sys.tables t
                       JOIN ' + QUOTENAME(name) + '.sys.schemas s
                            on s.schema_id = t.schema_id'
                    FROM sys.databases
                   WHERE state = 0 AND name = @SchemaName
                   ORDER BY [name]
                  FOR XML PATH(''), TYPE).value('.', 'nvarchar(max)');

        SET @sql
            = STUFF(@sql, 1, 12, '')
              + N' order by DatabaseName, 
                                                       SchemaName,
                                                       TableName';

        EXECUTE (@sql);
        """;

    /// <summary>
    /// Get column details for table, calling code must provide value for @TableName parameter
    /// </summary>
    public const string GetColumnDetailsForTable =
        """
        SELECT X.COLUMN_NAME AS ColumnName,
              X.ORDINAL_POSITION AS Position,
              X.TABLE_CATALOG AS Catalog,
              X.TABLE_SCHEMA AS TableSchema,
              X.COLUMN_DEFAULT AS ColumnDefault,
              X.DATA_TYPE AS DataType
        FROM INFORMATION_SCHEMA.COLUMNS AS X
        WHERE X.TABLE_NAME = @TableName 
        """;

    /// <summary>
    /// Get all database names from master
    /// </summary>
    public static string GetDatabaseNames =>
        """
        SELECT TableName = DB_NAME(s_mf.database_id)
        FROM sys.master_files s_mf
        WHERE s_mf.state = 0 -- ONLINE
              AND HAS_DBACCESS(DB_NAME(s_mf.database_id)) = 1
              AND DB_NAME(s_mf.database_id) NOT IN ( 'master', 'tempdb', 'model', 'msdb' )
              AND DB_NAME(s_mf.database_id)NOT LIKE 'ReportServer%'
        GROUP BY s_mf.database_id
        ORDER BY 1;
        """;
    public static string TableNamesForDatabase(string databaseName) =>
        $"""
         SELECT TABLE_NAME AS TableName
          FROM [{databaseName}].INFORMATION_SCHEMA.TABLES
         WHERE TABLE_TYPE = 'BASE TABLE'
           AND TABLE_NAME <> 'sysdiagrams'
         ORDER BY TABLE_NAME;
         """;
}
