-- 1. 뉴욕과 달라스에서 근무하는 사원들의 부서명과 평균 급여를 출력하는 코드를 작성하세요.
select dname, trunc(avg(sal))
from emp inner join dept
on emp.deptno = dept.deptno
where loc in ('NEW YORK', 'DALLAS')
group by dname;