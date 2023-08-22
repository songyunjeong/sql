-- 1. EMP 테이블에서 부서번호가 10, 20인 사원의 모든 정보를 출력하는 SELECT 문장을 작성하시오. 단, 부서와 이름순으로 정렬하시오.
select *
from emp
where deptno in (10, 20)
order by deptno, ename;

-- 2. EMP 테이블에서 1981년에 입사한 사원 중 10번과 30번 부서에 속한 사원의 모든 정보를 출력하는 SELECT 문을 작성하시오.
select *
from emp
where hiredate >= '1981/01/01' and hiredate < '19821/01/01' and deptno in (10, 30);

-- 3. EMP 테이블에서 상여금이 급여보다 10% 이상 많은 모든 사원에 대하여 이름, 급여, 상여금을 출력하는 SELECT 문을 작성하시오.
select ename, sal, comm
from emp
where comm > sal * 1.1;

-- 4. EMP 테이블에서 업무가 'CLERK'이거나 'ANALYST'이고 급여가 1000, 3000, 5000 이 아닌 모든 사원의 정보를 출력하는 SELECT 문을 작성하시오.
select *
from emp
where job in ('CLERK', 'ANALYST') and sal not in (1000, 3000, 5000);

-- 5. EMP 테이블에서 이름에 L이 두 자가 있고 부서가 30 이거나 또는 관리자 번호가 7782 인 사원의 모든 정보를 출력하는 SELECT 문을 작성하시오.
select *
from emp
where ename LIKE '%L%L' and (deptno = 30 or mgr = 7782);

-- 6. EMP 테이블에서 현재 급여에 15%가 증가된 급여를 사원번호, 이름, 업무, 급여, 증가된 급여(New Salary), 증가액(Increase)을 출력하는 SELECT 문장을 기술하시오.
select empno, ename, job, sal, sal * 1.15 as "New Salary", sal * 1.5 - sal as "Increase"
from emp;