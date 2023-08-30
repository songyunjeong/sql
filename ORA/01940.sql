-- ORA-01940: cannot drop a user that is currently connected
-- https://positivemh.tistory.com/55

select sid, serial#, username, status
from v$session
where username = 'SCOTT'
/

col username format a10

alter system kill session '23, 57831';