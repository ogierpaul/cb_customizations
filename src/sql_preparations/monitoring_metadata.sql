USE ROLE CB_ADMIN;

CREATE OR REPLACE VIEW CB_ADMIN.ADMIN.METADATA_MODELS
AS 
(
SELECT
TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
FROM CB_DEV.DEV.METADATA_MODELS
UNION
SELECT
TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
FROM CB_DEV.STG.METADATA_MODELS
UNION
SELECT
TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
FROM CB_STANDARD.PROD.METADATA_MODELS
UNION
SELECT
TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
FROM CB_CLIENT1.PROD.METADATA_MODELS
UNION
SELECT
TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
FROM CB_CLIENT2.PROD.METADATA_MODELS
);

CREATE VIEW OR REPLACE CB_GENERAL.PUBLIC.METADATA_MODELS_STANDARD
AS
(SELECT
TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
FROM CB_ADMIN.ADMIN.METADATA_MODELS
WHERE TABLE_CATALOG = 'CB_STANDARD');

CREATE OR REPLACE VIEW CB_ADMIN.ADMIN.DIFF_META_TABLES AS (
SELECT
'exist in project but not in standard' AS DEVIATION, TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
FROM CB_ADMIN.ADMIN.METADATA_MODELS a
WHERE TABLE_NAME NOT IN (SELECT TABLE_NAME FROM CB_GENERAL.PUBLIC.METADATA_MODELS_STANDARD)
UNION
SELECT
'exist in standard but not in project' AS DEVIATION, TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
FROM CB_GENERAL.PUBLIC.METADATA_MODELS_STANDARD a
WHERE TABLE_NAME NOT IN (SELECT TABLE_NAME FROM CB_ADMIN.ADMIN.METADATA_MODELS)
);