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

-- 실습 5 간단버전
select 
    substr(ename,1 ,length(ename)/2-0.5) || '*' || substr(ename, length(ename)/2+1.5) as 실습5_간단
from emp;


-- 숫자 조정 -- 
-- trunc : 특정 위치에서 버림
-- trunc( 숫자, 버릴 갯수 ), 두 번째 전달인자 안 쓰면 소수점 이하로 다 버림
select 
    trunc(1234.5678), -- 1234
    trunc(1234.5678, 2), -- 1234.56
    trunc(1234.5678, -2), -- 1200
    trunc(-12.34) -- -12
from dual;

-- ceil : 올림
-- floor : 내림
select 
    ceil(3.14), // 4
    floor(3.14), // 3
    ceil(-3.14), // -3
    floor(-3.14) // -4
from dual;


-- 날짜 데이터 --
-- sysdate : 지금 오라클 pc의 시간
-- 강사 pc는 한국 시간과 9시간 차이 난다( 영국 기준 시간으로 되어있음 )
-- 날짜 정보 중 일부만 select로 표시
select 
    sysdate, -- 24/06/24
    sysdate + 1, -- 24/06/25
    sysdate - 1, -- 24/06/23
    sysdate + 8 -- 24/07/02
from dual;

-- 컬럼에 + 를 사용하면 모두 숫자로 변경하여 적용
-- || 숫자도 문자로 적용하여 적용
-- to_char : 날짜 -> 문자
select 
    to_char(sysdate, 'YYYY"년" MM"월" DD"일" HH24"시" MI"분" SS"초"')
from dual;

-- to_date : 문자 -> 날짜
-- 날짜만 넣었을 경우 시간은 자동으로 0시로 됨
select 
    sysdate - to_date('2024-05-07', 'yyyy-mm-dd')
from dual;

-- nvl : 만약에 null이라면 두번째 인자로 대체해라
select 
    comm, 
    nvl(comm, -1),
    sal,
    sal + comm,
    sal + nvl(comm, 0)
from emp;

select * from emp
where comm = 0 or comm is null;
-- 위아래 코드는 같은 결과 값을 가짐
select * from emp
where nvl(comm, 0) = 0;


-- case : if문 느낌~
select
    comm,
    case
    -- 컬럼의 내용은 같은 형이여야함 -> comm 은 숫자이기 때문에 형 맞추기 위해 문자로 변환
        when comm is null then 'N/A'
        else to_char(comm)
    end as new_comm
from emp;

select 
    comm,
    nvl(comm, 0) as nvl,
    case
        when comm is null then 0
        else comm
    end as case
from emp;


-- p 174 Q2
select 
    empno, ename, sal,
    trunc((sal / 21.5), 2) as DAY_PAY,
    round((sal / (21.5 * 8)), 1) as TIME_PAY
from emp;

-- p 175 Q3
select 
    empno, ename, 
    to_char(hiredate, 'yyyy-mm-dd') as hiredate,
    to_char(add_months(hiredate, 3), 'yyyy-mm-dd') as R_JOB,
    to_char(next_day((add_months(hiredate, 3)), '월요일'), 'yyyy-mm-dd') as R_JOB_mon,
    nvl(to_char(comm), 'N/V') as COMM
from emp;

-- p 175 Q4
-- 방법 1
select 
    empno, ename,
    case 
        when mgr is null then ' ' 
        else to_char(mgr)
    end as mgr,
    case 
        when mgr is null then '0000'
        when mgr >= 7500 and mgr < 7600 then '5555'
        when mgr >= 7600 and mgr < 7700 then '6666'
        when mgr >= 7700 and mgr < 7800 then '7777'
        when mgr >= 7800 and mgr < 7900 then '8888'
        else to_char(mgr)
    end as chg_mgr
from emp;

-- 방법 2
select 
    empno, ename, 
    case 
        when mgr is null then ' ' 
        else to_char(mgr)
    end as mgr,
    case 
        when mgr is null then '0000'
        when mgr like '75%' then '5555'
        when mgr like '76%' then '6666'
        when mgr like '77%' then '7777'
        when mgr like '78%' then '8888'
        else to_char(mgr)
    end as chg_mgr
from emp;

-- 방법 3
select 
    empno, ename, 
    case 
        when mgr is null then ' ' 
        else to_char(mgr)
    end as mgr,
    case 
        when mgr is null then '0000'
        when substr(mgr,1,2) = 75 then '5555'
        when substr(mgr,1,2) = 76 then '6666'
        when substr(mgr,1,2) = 77 then '7777'
        when substr(mgr,1,2) = 78 then '8888'
        else to_char(mgr)
    end as chg_mgr
from emp;

-- 방법 4
select 
    empno, ename, 
    case 
        when mgr is null then ' ' 
        else to_char(mgr)
    end as mgr,
    case 
        when mgr is null then '0000'
        else case substr(mgr,1,2)
            when '75' then '5555'
            when '76' then '6666'
            when '77' then '7777'
            when '78' then '8888'
            else to_char(mgr)
        end
    end as chg_mgr
from emp;

-- 방법 5
select 
    empno, ename, 
    case 
        when mgr is null then ' ' 
        else to_char(mgr)
    end as mgr,
    case 
        when sudstr(2,1) in ('5', '6', '7', '8') then lpad(sudstr(2,1), 4, sudstr(2,1))
        else nvl(mgr, 0) 
    end as chg_mgr
from emp;



-- 다중행 함수(집계함수) --
-- 출력될 때 값의 갯수가 다르면 오류, 한 줄이면 한 줄만 같이 나와야함
-- count : null은 포함되지 않음
-- -> *을 쓰는 것이 안정적이기에 *를 자주 씀
select sum(sal), count(sal), count(*), count(comm) from emp;

-- 특정 단어가 들어가는 것 갯수 세기
select * from emp 
where ename like '%A%';
select count(*) from emp 
where ename like '%A%';

select max(sal), max(ename), min(hiredate), min(comm), avg(sal) from emp;

-- 부서별 부서 연봉 총 합, 평균 표시
select sum(sal), avg(sal) from emp
where deptno = 10
union all
select sum(sal), avg(sal) from emp
where deptno = 20
union all
select sum(sal), avg(sal) from emp
where deptno = 30;


-- group by : 같은 데이터를 묶어줌
-- group by가 있는 select : group by 한 것이나 다중행 함수(집계 함수)만 올 수 있음
select deptno, avg(sal), sum(sal), count(*) from emp
group by deptno;

select deptno, empno from emp
group by deptno, empno;

select deptno, job, count(*)
from emp
group by deptno, job
order by deptno, job;

-- having : group by에서만 사용
-- 집계함수를 조건으로 걸고 싶을 때(where 대신) 사용
select deptno, job, avg(sal)
from emp
group by deptno, job
    having avg(sal) >= 2000;
    

-- p 212 Q1
select 
    deptno,
    trunc(avg(sal)) as avg_sal,
    max(sal) as max_sal,
    min(sal) as min_sal,
    count(*) as cnt
from emp
group by deptno;

-- p 212 Q2
select
    job, count(*)
from emp
group by job
    having count(*) >= 3;
    
    
-- 사원번호 앞자리 2개 빼고 마스킹
select 
    empno,
    substr(empno, 1, 2),
    rpad(substr(empno, 1, 2), length(empno), '*')
from emp;

select * from dept;


-- 동작 순서
/* 5 */ select job, count(*) as cnt
/* 1 */ from emp 
/* 2 */ where sal > 1000 
/* 3 */ group by job
/* 4 */ having count(*) >= 3
/* 6 */ order by cnt desc;

select * from emp, dept order by empno;

-- 테이블 두 개 이상 조회할 때 관계(where)를 꼭 알려줘야 원하는 정보만 출력된다
-- 전체 테이블 수 - 1개의 조건이 적당
select * from emp, dept
where emp.deptno = dept.deptno
order by empno;

-- 테이블명 별칭(as 못 씀)
select *
from emp e, dept d
where e.deptno = d.deptno;

-- *와 컬럼을 같이 쓸 경우 *에 테이블을 지정해줘야함(단독 포함)
select e.ename, d.*
from emp e, dept d
where e.deptno = d.deptno;

select * from salgrade;

select * from emp e, salgrade s
where s.losal <= e.sal and s.hisal >= e.sal ;

-- null인 데이터는 조인 불가
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename from emp e1, emp e2
where e1.mgr = e2.empno;


-- using : 같은 컬럼명이 있는 경우에만 쓸 수 있음
select * from emp join dept using (deptno);


select * from emp join dept on (emp.deptno = dept.deptno);

select * from emp e1 join emp e2 on (e1.mgr = e2.empno);


-- left outer join : 왼쪽의 테이블의 내용이 모두 출력되는 걸 보장(null 포함)
select * from emp e1 left outer join emp e2 on (e1.mgr = e2.empno);

select * from emp e1 right outer join emp e2 on (e1.mgr = e2.empno);

-- from에 , 써서 테이블 조인, 안 나오는 값들을 데려오기 위해 left out join 사용, on으로 조건 주기

select * from emp;
select * from dept;
select * from salgrade;

-- 실습 1
-- empno, ename, dname, loc 출력 : 결과 14줄
-- 방법 1 - where
select empno, ename, dname, loc from emp e, dept d
where e.deptno = d.deptno 
order by e.deptno;
-- 방법 2 - using
select empno, ename, dname, loc 
from emp 
join dept using (deptno) 
order by deptno;
-- 방법 3 - left outer join
select empno, ename, dname, loc 
from emp e 
left outer join dept d on (e.deptno = d.deptno)
order by e.deptno;

-- 실습 2
-- 사번, 이름, 부서명, 급여등급 출력
-- 방법 1 - where
select empno, ename, dname, grade from emp e, dept d, salgrade s
where (e.deptno = d.deptno) 
and (e.sal >= s.losal and e.sal <= s.hisal)
order by grade;
-- 방법 2 - join
select empno, ename, dname, grade 
from emp e 
join dept d on (e.deptno = d.deptno) 
join salgrade s on (e.sal >= s.losal and e.sal <= s.hisal)
order by grade;
-- 방법 3 - left outer join
select empno, ename, dname, grade 
from emp e
left outer join dept d on (e.deptno = d.deptno)
left outer join salgrade s on (e.sal >= s.losal and e.sal <= s.hisal)
order by grade;
-- 방법 4 - using + where
select empno, ename, dname, grade 
from salgrade s, emp e 
join dept d using (deptno) 
where e.sal >= s.losal and e.sal <= s.hisal
order by grade;

-- 실습 3
-- 매니저보다 월급이 높은 사원의 이름, 급여, 매니저 이름, 매니저 급여
select e1.ename, e1.sal, d.dname, e2.ename, e2.sal 
from emp e1 join dept d using (deptno), emp e2
where e1.mgr = e2.empno 
and e1.sal > e2.sal;

-- p 239 Q1
select d.deptno, d.dname, e.empno, e.ename, e.sal from emp e, dept d
where e.deptno = d.deptno
and e.sal > 2000
order by deptno;

select deptno, dname, e.empno, e.ename, e.sal 
from emp e 
join dept using (deptno)
where e.sal > 2000
order by deptno; 

-- p239 Q2
select 
    deptno,
    dname,
    count(*) as cnt,
    trunc(avg(sal)) as avg_sal,
    max(sal) as max_sal,
    min(sal) as min_sal
from emp 
join dept using (deptno)
group by deptno, dname
order by deptno;

-- p239 Q3
select d.deptno, dname, empno, ename, job, sal
from emp e
right outer join dept d on (e.deptno = d.deptno)
order by deptno, ename;

--- p240 Q4
select d.deptno, dname, e1.empno, e1.ename, e1.mgr, e1.sal, e1.deptno, losal, hisal, grade, e2.empno, e2.ename
from 
    emp e1
    left outer join emp e2 on (e1.mgr = e2.empno)
    right outer join dept d on (e1.deptno = d.deptno)
    left outer join salgrade s on (e1.sal >= s.losal and e1.sal <= s.hisal)
order by d.deptno;


-- 서브쿼리 -- 
select sal from emp where ename = 'JONES'; -- 2975

select * from emp
where sal > (select sal from emp where ename = 'JONES');

-- 평균 급여보다 더 많이 받는 사람
select avg(sal) from emp;

select * from emp
where sal > (select avg(sal) from emp);

-- blake씨보다 높은 연봉을 받는 사람들
select sal from emp where ename = 'BLAKE';

select * from emp
where sal > (select sal from emp where ename = 'BLAKE');

-- jones씨와 같은 job을 가지고 있는 사람들
select job from emp where ename = 'JONES';

select * from emp 
where job = (select job from emp where ename = 'JONES');


select max(sal) from emp group by deptno;

select * from emp 
where sal in (select max(sal) from emp group by deptno);

