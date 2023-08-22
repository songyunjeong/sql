-- 1. 사원 중에서 월급을 가장 많이 받는 사원의 이름, 업무 입사일, 급여 정보를 출력하는 쿼리를 작성하세요.
select ename, job, hiredate, sal
from emp
where sal = (select max(sal) from emp);

-- 2. EMP 테이블에서 각 업무별 평균 급여가 전체 사원의 평균 급여 이상인 경우의 값을 출력하는 쿼리를 작성하세요.
select job, avg(sal)
from emp
group by job
having avg(sal) >= (select avg(sal) from emp);

-- 3. 시카고에 근무하는 사원의 이름, 업무, 입사일, 부서번호 정보를 출력하는 코드를 작성하세요.
-- 서브쿼리 ⬇︎
-- 다음은 잘못된 쿼리입니다.
select ename, job, hiredate, deptno
from emp
where deptno = (select deptno from dept where loc = 'CHICAGO'); -- 왜? 비교 연산자는 동시에 여러가지 값을 비교할 수 없다.
-- 다음은 올바른 쿼리입니다.
select ename, job, hiredate, deptno
from emp
where deptno in (select deptno from dept where loc = 'CHICAGO');
-- JOIN ⬇︎
select ename, job, hiredate, dept.deptno
from emp inner join dept on emp.deptno = dept.deptno
where loc = 'CHICAGO';

insert into dept
values (50, '개발부', 'CHICAGO');

-- 4. MARTIN 사원과 동일한 급여를 받는 사원의 이름, 업무, 입사일, 부서번호 정보를 출력하는 쿼리를 작성하세요.
-- 다음은 잘못된 쿼리입니다.
select ename, job, hiredate, deptno
from emp
where sal = (select sal from emp where ename = 'MARTIN'); -- 왜? 동명이인이 얼마든지 있을 수 있다.
-- 다음은 올바른 쿼리입니다.
select ename, job, hiredate, deptno
from emp
where sal in (select sal from emp where ename = 'MARTIN'); -- 단일행과 다중행을 명확히 구분할 것!

-- 5. EMP 테이블에서 한 명 이상의 부하직원을 가지는 관리자의 이름, 업무, 입사일, 급여, 부서번호를 출력하는 쿼리를 작성하세요.
select ename, job, hiredate, sal, deptno
from emp
where empno in (select mgr from emp);
-- 위의 관리자 정보를 출력하는 쿼리를 조인을 이용하여 출력하는 쿼리를 작성하세요. (여기서는 서브쿼리를 사용하는 게 좋지만, JOIN으로도 할 수 있다.)
select distinct manager.ename, manager.job, manager.hiredate, manager.sal, manager.deptno
from emp worker inner join emp manager on worker.mgr = manager.empno;

-- 6. EMP 테이블에서 부하 직원이 한 명도 없는 평사원의 이름, 업무, 입사일, 급여, 부서번호를 출력하는 쿼리를 작성하세요.
select ename, job, hiredate, sal, deptno
from emp
where empno not in (select mgr from emp where mgr is not null);
-- 주의! null 값이 있을 때 not -> or로 연결되느냐 and로 연결되느냐

-- 7. EMP 테이블에서 30번 부서에 속한 어떤 사원 보다 더 많은 급여를 받는 사원들의 이름, 업무, 급여, 부서번호 정보를 출력하는 쿼리를 작성하세요.
-- 단, 30번 부서원은 제외합니다.
select ename, job, sal, deptno
from emp
where sal > any (select sal from emp where deptno = 30) and deptno != 30;
-- 위 쿼리를 풀어서 살펴보자.
select sal from emp where deptno = 30;

       SAL
----------
      1600
      1250
      1250
      2850
      1500
       950

select ename, job, sal, deptno
from emp
where sal > any (1600, 1250, 1250, 2850, 1500, 950) and deptno != 30;

-- 8. EMP 테이블에서 한 명 이상의 부하직원을 가지는 관리자의 이름, 업무, 입사일, 급여, 부서번호를 출력하는 쿼리를 작성하세요.
select ename, job, hiredate, sal, deptno
from emp e
where exists (select * from emp where mgr = e.empno);

-- 9. SCOTT 사원과 동일한 급여와 상여금을 받는 모든 사원의 정보를 출력하는 쿼리를 작성하세요.
select *
from emp
where (sal, nvl(comm, -1)) in (select sal, nvl(comm, -1) from emp where ename = 'SCOTT');