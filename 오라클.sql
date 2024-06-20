-- 한 줄 주석
/* 범위 주석 */
select 
    * -- 테이블에서 가져올 것 / * : 모든 컬럼
from 
    emp; -- 테이블명
    
select 
    empno, ename, deptno -- 조회하고 싶은 컬럼만 가져옴
from 
    emp;
    
select * from dept;

select * from salgrade;

select deptno from emp;

-- distinct : select에서 중복되는 자료를 제거해준다
select distinct deptno from emp;

select distinct job from emp;
-- 컬럼이 여러개인 경우 컬럼들의 조합이 중복되는 걸 제거
select distinct deptno, job from emp;

-- null과 연산하면 그 값은 무조건 null
select ename, sal, sal*12+comm, comm from emp;

-- as "" : 컬럼명 별칭
-- "" 생략 가능 단, 띄어쓰기가 있다면 필수(웬만하면 띄어쓰기보다 _ 쓰기)
-- as 생략 가능
select ename, sal, sal*12+comm as "new_sal", comm from emp;

-- order by : 해당 컬럼으로 정렬
-- 오름차순 : asc, 기본값이라 생략 가능
select * from emp 
order by sal asc;

-- 내림차순 : desc
select * from emp 
order by sal desc;

-- null : 가장 마지막에 옴
select * from emp 
order by comm;

-- order by : 첫번째거로 정렬, 이후 같은게 있다면 다음거로 정렬
-- 중복되는게 없다면 다음거 진행 X
select * from emp
order by deptno, sal desc;

-- p92 Q2
select distinct job from emp order by job desc;



-- where : if문과 비슷, 해당 조건이 충족되는 것만 출력
select * from emp
where deptno = 30; -- 부서번호(deptno)가 30인 것들만 출력

-- 사원번호(empno)가 7782인 것
select * from emp where empno = 7782;
-- 연봉(sal)이 2000이상인 것
select * from emp where sal >= 2000 order by sal;
-- 홀따옴표 사용!
select * from emp where ename = 'KING';

-- and = &&
select * from emp where deptno = 30 and job = 'SALESMAN';
select * from emp where job = 'CLERK' and deptno = 30;

-- or = ||
select * from emp where job = 'CLERK' and deptno = 30 or deptno = 20;
-- 우선순위 신경쓰기!
select * from emp where job = 'CLERK' and (deptno = 30 or deptno = 20);

select * from emp where sal >= 2000 and sal < 3000 order by sal;

-- !=, ^=, <> 모두 같지 않다는 뜻임( <>을 제일 많이 사용)
select * from emp where sal != 3000;
select * from emp where sal ^= 3000;
select * from emp where sal <> 3000;

-- 두 개의 결과 값이 같음( not 사용 )
select * from emp where sal < 2000 or sal >= 3000;
select * from emp where not(sal >= 2000 and sal < 3000);

-- or or or... 연산일 땐 in 사용하면 축약 가능
select * from emp where job in ('MANAGER', 'SALESMAN', 'CLERK');
-- in 앞에 not 붙여주기
select * from emp where job not in ('MANAGER', 'SALESMAN', 'CLERK');

