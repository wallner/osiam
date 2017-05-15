--
-- The MIT License (MIT)
--
-- Copyright (C) 2013-2016 tarent solutions GmbH
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

CREATE TABLE SPRING_SESSION (
  SESSION_ID            CHAR(36) NOT NULL,
  CREATION_TIME         BIGINT   NOT NULL,
  LAST_ACCESS_TIME      BIGINT   NOT NULL,
  MAX_INACTIVE_INTERVAL INT      NOT NULL,
  PRINCIPAL_NAME        VARCHAR(100),
  CONSTRAINT SPRING_SESSION_PK PRIMARY KEY (SESSION_ID)
)
  ENGINE = InnoDB;

CREATE INDEX SPRING_SESSION_IX1
  ON SPRING_SESSION (LAST_ACCESS_TIME);

CREATE TABLE SPRING_SESSION_ATTRIBUTES (
  SESSION_ID      CHAR(36)     NOT NULL,
  ATTRIBUTE_NAME  VARCHAR(200) NOT NULL,
  ATTRIBUTE_BYTES BLOB         NOT NULL,
  CONSTRAINT SPRING_SESSION_ATTRIBUTES_PK PRIMARY KEY (SESSION_ID, ATTRIBUTE_NAME),
  CONSTRAINT SPRING_SESSION_ATTRIBUTES_FK FOREIGN KEY (SESSION_ID) REFERENCES SPRING_SESSION (SESSION_ID)
    ON DELETE CASCADE
)
  ENGINE = InnoDB;

CREATE INDEX SPRING_SESSION_ATTRIBUTES_IX1
  ON SPRING_SESSION_ATTRIBUTES (SESSION_ID);