-- 1. CHICAGO에서 근무하는 사원의 급여를 10% 인상하는 쿼리를 작성하세요.
update emp
set sal = sal * 1.1
where deptno in (select deptno from dept where loc = 'CHICAGO');

-- 2. MILLER 사원의 업무는 SCOTT 사원의 업무와 같고, 급여는 FORD 사원과 같은 급여를 받도록 업데이트 작업을 수행하세요.
update emp
set job = (select job from emp where ename = 'SCOTT'), sal = (select sal from emp where ename = 'FORD')
where ename = 'MILLER';