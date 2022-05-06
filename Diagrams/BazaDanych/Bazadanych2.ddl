-- Generated by Oracle SQL Developer Data Modeler 4.1.5.907
--   at:        2022-05-06 20:13:50 CEST
--   site:      SQL Server 2012
--   type:      SQL Server 2012




CREATE
  TABLE Comments
  (
    Id INTEGER NOT NULL ,
    Text TEXT NOT NULL ,
    DATE DATETIME NOT NULL ,
    Deletred BIT NOT NULL ,
    Users_Id VARCHAR (450) ,
    Posts_Id INTEGER ,
    ModedBy  VARCHAR (450) 
  )
  ON "default"
GO
CREATE UNIQUE NONCLUSTERED INDEX
Comments__IDX ON Comments
(
  ModedBy
)
ON "default"
GO
ALTER TABLE Comments ADD CONSTRAINT Comments_PK PRIMARY KEY CLUSTERED (Id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE Posts
  (
    Id INTEGER NOT NULL ,
    Title TEXT NOT NULL ,
    Text TEXT NOT NULL ,
    Rating INTEGER NOT NULL ,
           DATE DATETIME NOT NULL ,
    Pinned BIT NOT NULL ,
    Deleted BIT NOT NULL ,
    Users_Id VARCHAR (450) ,
    ModedBy  VARCHAR (450) 
  )
  ON "default"
GO
CREATE UNIQUE NONCLUSTERED INDEX
Posts__IDX ON Posts
(
  ModedBy
)
ON "default"
GO
ALTER TABLE Posts ADD CONSTRAINT Posts_PK PRIMARY KEY CLUSTERED (Id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE Tags
  (
    Id INTEGER NOT NULL ,
    Text TEXT NOT NULL ,
    Posts_Id INTEGER
  )
  ON "default"
GO
ALTER TABLE Tags ADD CONSTRAINT Tags_PK PRIMARY KEY CLUSTERED (Id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE Users
  (
    Id VARCHAR (450) NOT NULL ,
    Email TEXT NOT NULL ,
    UserName TEXT NOT NULL ,
    PhoneNumber TEXT NOT NULL ,
    Ban BIT NOT NULL ,
    ModedBy VARCHAR (450)
  )
  ON "default"
GO
CREATE UNIQUE NONCLUSTERED INDEX
Users__IDX ON Users
(
  ModedBy
)
ON "default"
GO
ALTER TABLE Users ADD CONSTRAINT Users_PK PRIMARY KEY CLUSTERED (Id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

ALTER TABLE Comments
ADD CONSTRAINT Comments_Posts_FK FOREIGN KEY
(
Posts_Id
)
REFERENCES Posts
(
Id
)
ON
DELETE NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Comments
ADD CONSTRAINT Comments_Users_FK FOREIGN KEY
(
Users_Id
)
REFERENCES Users
(
Id
)
ON
DELETE NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Comments
ADD CONSTRAINT Comments_Users_FKv2 FOREIGN KEY
(
ModedBy
)
REFERENCES Users
(
Id
)
ON
DELETE NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Posts
ADD CONSTRAINT Posts_Users_FK FOREIGN KEY
(
Users_Id
)
REFERENCES Users
(
Id
)
ON
DELETE NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Posts
ADD CONSTRAINT Posts_Users_FKv2 FOREIGN KEY
(
ModedBy
)
REFERENCES Users
(
Id
)
ON
DELETE NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Tags
ADD CONSTRAINT Tags_Posts_FK FOREIGN KEY
(
Posts_Id
)
REFERENCES Posts
(
Id
)
ON
DELETE NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Users
ADD CONSTRAINT Users_Users_FK FOREIGN KEY
(
ModedBy
)
REFERENCES Users
(
Id
)
ON
DELETE NO ACTION ON
UPDATE NO ACTION
GO


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             3
-- ALTER TABLE                             11
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
