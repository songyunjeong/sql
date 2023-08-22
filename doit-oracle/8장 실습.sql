-- 1.
select emp.deptno, dname, empno, ename, sal
from emp inner join dept
on emp.deptno = dept.deptno
where sal > 2000;

-- 2.
select emp.deptno, dname, avg(sal), max(sal), min(sal), count(*)
from emp inner join dept
on emp.deptno = dept.deptno;

select 'Oracle',
lpad('Oracle', 10, '#') as LPAD_1,
rpad('Oracle', 10, '*') as RPAD_1,
lpad('Oracle', 10) as LPAD_2,
rpad('Oracle', 10) as RPAD_2
from dual;