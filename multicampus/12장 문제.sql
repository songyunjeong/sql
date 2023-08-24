-- 1. CTAS 기능을 사용하여 EMP 테이블과 동일한 구조를 가지는 비어있는 테이블 EMP_EMPTY를 만드는 쿼리를 작성하세요.
create table emp_empty
as
select * from emp
where 1 = 0;
-- 빈 테이블을 만들러면
-- 아무것도 반환하지 않도록 where절 조건을 작성해야함
-- 어떤 경우라도 항상 조건이 거짓이 되어지면 아무것도 반환하지 않음
desc emp_empty
select * from emp_empty; -- 비어있음