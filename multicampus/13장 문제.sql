-- 1. EMP 테이블에서 월급을 가장 많이 받는 사원 3명을 출력하는 쿼리를 작성하세요.
select rownum, ename, job, sal, hiredate
from emp;
-- rownum 가상의 컬럼을 사용할 수 있음
-- 실제 테이블에서는 존재하지 않지만 오라클에서 제공함. sudo column라고 함.
select rowname, ename, job, sal, hiredate
from (select ename, job, sal, hiredate
      from emp
      order by sal desc)
where rownum <= 3;