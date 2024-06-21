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

-- null과 연산하면 그 값은 무조건 null!!
select ename, sal, sal*12+comm, comm from emp;

-- as "" : 컬럼명 별칭
-- "" 생략 가능 단, 띄어쓰기가 있다면 필수(웬만하면 띄어쓰기보다 _ 쓰기)
-- as 생략 가능
select ename, sal, sal*12+comm as "new_sal", comm from emp;


-- order by --
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


-- where --
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

-- between : 두 개의 값 사이 사이값인것들 출력
select * from emp where sal between 2000 and 3000;


-- like --
-- % : 와일드 카드, 길이 상관 없이 모든 문자 데이터, 문자 없는 경우도 포함
-- S로 시작하는 것들 출력
select * from emp where ename like 'S%';
select * from emp where ename like 'A%';

-- _ : 와일드 카드, 단 한 개의 문제 데이터
-- 두번째 글자가 L 인것만 출력
select * from emp where ename like '_L%';
-- 4글자만 출력( _ 4개 )
select * from emp where ename like '____';

-- 중간에 AM이 있는 거 찾기
select * from emp where ename like '%AM%';

select * from emp where comm <= 400;


-- null --
-- is null : null 인 것만 출력
select * from emp where comm is null;

-- is not null : null 아닌 것만 출력
select * from emp where comm is not null;

-- emp에서  deptno가 10 또는 20인 사원의 empno, ename, sal, deptno 출력
-- 방법 1
select empno, ename, sal, deptno from emp where deptno = 10 or deptno = 20;
-- 방법 2
select empno, ename, sal, deptno from emp where deptno in (10, 20);


-- union --
-- union : 테이블 연결, 중간에 ; 대신 union 사용
-- 단, 조회한 컬럼의 개수, 타입 같아야함
select empno, ename, sal, deptno from emp where deptno = 10
union
select empno, ename, sal, deptno from emp where deptno = 20;

-- union : 중복된 자료 제거
select empno, ename, sal, deptno from emp where deptno = 10
union
select empno, ename, sal, deptno from emp where deptno = 10;

-- union all : 중복되는 것까지 다 나옴, 실무에서 더 많이 사용
select empno, ename, sal, deptno from emp where deptno = 10
union all
select empno, ename, sal, deptno from emp where deptno = 10;


-- p125 Q1
select * from emp where ename like '%S';

-- p125 Q2
select empno, ename, job, sal, deptno from emp where deptno = 30 and job = 'SALESMAN';

-- p125 Q3
select empno, ename, job, sal, deptno from emp where (deptno in (20, 30)) and sal > 2000;

select empno, ename, job, sal, deptno from emp where (deptno in (20, 30)) 
intersect
select empno, ename, job, sal, deptno from emp where sal > 2000;

select empno, ename, job, sal, deptno from emp where deptno = 20 and sal > 2000
union all
select empno, ename, job, sal, deptno from emp where deptno = 30 and sal > 2000;

-- p126 Q4
select * from emp where (sal < 2000) or (sal > 3000);

-- p126 Q5
select ename, empno, sal, deptno from emp 
    where (ename like '%E%') and (deptno = 30) and (sal < 1000 or sal > 2000);
    
-- p126 Q6
select * from emp 
    where (comm is null) 
    and (mgr is not null)
    and (job in ('MANAGER', 'CLERK')) 
    and (ename not like '_L%');
    
    
-- 함수 -- 
-- upper : 대문자
-- lower : 소문자
-- initcap : 첫글자만 대문자, 이후 소문자
select ename, upper(ename), lower(ename), initcap(ename) from emp;

-- upper, lower : 대소문자 구분 없이 like할 때 사용하기 좋음
select * from emp where lower(ename) like lower('%Mi%');


-- length : 길이
select ename, length(ename) from emp;

select * from emp where length(ename) >= 5;

-- dual : 임시 테이블, 연습용
-- length : 글자 크기
-- lengthb : byte 크기 (중요X)
select length('한'), lengthb('한') from dual;

-- substr(대상이 되는 문자, 시작 위치, 가져올 개수)
-- substr(job, 1, 2) : 첫번째 글자에서 2자리
-- -붙으면 뒤에서부터
-- 가져올 개수가 없거나 너무 크다면 끝까지 출력
-- 인자에 length 사용 가능
-- lower, upper 사용 가능 -> 글자로 돌려주기 때문
select job, 
    substr(job, 1, 2), 
    substr(job, 0, 2), 
    substr(job, 3, 3), 
    substr(job, 5), 
    ename, 
    substr(job, -3, 2),
    lower(substr(job, 5, 100))
from emp;

-- replace : 문자 바꾸기
-- replace (대상이 되는 문자, 바꿀 문자, 대체할 문자)
select job, replace(job, 'A', '*') from emp;

select job, 
    length(job), 
    length(job) / 2, 
    substr(job, (length(job)+1) / 2, 1),
    replace(job, substr(job, (length(job)+1) / 2, 1), '*')
from emp;

-- lpad(rpad) : 데이터의 길이를 지정한 후 남은 빈공간 왼쪽(오른쪽)에 문자로 채움
-- lpad(대상이 되는 문자, 전체 자리수, 채울 문자)
select job, lpad(job, 10, '#'), lpad(job, 4, '#') from emp;

select job, length(job), 15-length(job) from emp;

select lpad(job, (15-length(job))/2 + length(job), '#') from emp;

-- || : 문자열 더하기
select empno || ename || '님' from emp;

-- trim : 앞 뒤 공백 제거, 단 글씨 사이의 공백은 제거하지 않음
select '    a   b    c      ', trim('    a   b    c      ') from dual;

-- 실습 1 --
-- 주민번호 뒷자리 마스킹
select '210621-3123456', 
    rpad((substr('210621-3123456', 1, 8)), length('210621-3123456'), '*')
from dual;

-- 실습 2 -- 
-- 사원의 이름을 앞에 두자리만 보이게 하고 나머지는 *로 표시
-- 실습 3 --
-- 앞글자 하나만 *
-- 실습 4 --
-- 두번째 글씨만 *
-- 실습 5 --
-- 가운데 글씨만 *
select 
    ename,
    rpad(substr(ename, 1, 2), length(ename), '*') as 실습2,
    lpad(substr(ename, 2), length(ename), '*') as 실습3,
    rpad(rpad(substr(ename, 1, 1), 2, '*'), length(ename), substr(ename, 3)) as 실습4,
    rpad
    (rpad(substr(ename,1 ,length(ename)/2-0.5), length(ename)/2+0.5, '*'), 
    length(ename), 
    substr(ename, length(ename)/2+1.5)) as 실습5
from emp;

-- 두번째 글씨만 *
-- ex. WARD -> W*RD
select 
    ename,
    substr(ename, 1, 1),
    substr(ename, 3),
    rpad(substr(ename, 1, 1), 2, '*'),
    rpad(rpad(substr(ename, 1, 1), 2, '*'), length(ename), substr(ename, 3))
from emp;

-- 가운데 글씨만 *
-- ex. MARTIN -> MA*TIN
select 
    ename,
    substr(ename,1 ,length(ename)/2-0.5) as str,
    substr(ename, length(ename)/2+1.5) as str2,
    rpad(substr(ename,1 ,length(ename)/2-0.5), length(ename)/2+0.5, '*') as rpad,
    rpad
    (rpad(substr(ename,1 ,length(ename)/2-0.5), length(ename)/2+0.5, '*'), 
    length(ename), 
    substr(ename, length(ename)/2+1.5)) as 실습5
from emp;


