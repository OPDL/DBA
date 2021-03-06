-- -----------------------------------------------------------------------------------
-- File Name    : https://oracle-base.com/dba/10g/sga_dynamic_components.sql
-- Author       : Tim Hall
-- Description  : Provides information about dynamic SGA components.
-- Requirements : Access to the v$ views.
-- Call Syntax  : @sga_dynamic_components
-- Last Modified: 23/08/2008
-- -----------------------------------------------------------------------------------
COLUMN component FORMAT A30

SELECT  component,
        ROUND(current_size/1024/1204) AS current_size_mb,
        ROUND(min_size/1024/1204) AS min_size_mb,
        ROUND(max_size/1024/1204) AS max_size_mb
FROM    v$sga_dynamic_components
WHERE   current_size != 0
ORDER BY component;
