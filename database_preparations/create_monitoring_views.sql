USE ROLE CB_ADMIN;
CREATE VIEW CB_ADMIN.ADMIN.VERSION AS
SELECT
'dev' as env,
version
FROM
CB_DEV.DEV.CB_VERSION
UNION
SELECT
'stage' as env,
version
FROM
CB_DEV.STG.CB_VERSION
UNION
SELECT
'standard' as env,
version
FROM
CB_STANDARD.PROD.CB_VERSION
UNION
SELECT
'client1' as env,
version
FROM
CB_CLIENT1.pROD.CB_VERSION
UNION
SELECT
'client2' as env,
version
FROM
CB_CLIENT2.pROD.CB_VERSION;