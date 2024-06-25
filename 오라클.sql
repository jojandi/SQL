-- �� �� �ּ�
/* ���� �ּ� */
select 
    * -- ���̺��� ������ �� / * : ��� �÷�
from 
    emp; -- ���̺��
    
select 
    empno, ename, deptno -- ��ȸ�ϰ� ���� �÷��� ������
from 
    emp;
    
select * from dept;

select * from salgrade;

select deptno from emp;

-- distinct : select���� �ߺ��Ǵ� �ڷḦ �������ش�
select distinct deptno from emp;

select distinct job from emp;
-- �÷��� �������� ��� �÷����� ������ �ߺ��Ǵ� �� ����
select distinct deptno, job from emp;

-- null�� �����ϸ� �� ���� ������ null!!
select ename, sal, sal*12+comm, comm from emp;

-- as "" : �÷��� ��Ī
-- "" ���� ���� ��, ���Ⱑ �ִٸ� �ʼ�(�����ϸ� ���⺸�� _ ����)
-- as ���� ����
select ename, sal, sal*12+comm as "new_sal", comm from emp;


-- order by --
-- order by : �ش� �÷����� ����
-- �������� : asc, �⺻���̶� ���� ����
select * from emp 
order by sal asc;

-- �������� : desc
select * from emp 
order by sal desc;

-- null : ���� �������� ��
select * from emp 
order by comm;

-- order by : ù��°�ŷ� ����, ���� ������ �ִٸ� �����ŷ� ����
-- �ߺ��Ǵ°� ���ٸ� ������ ���� X
select * from emp
order by deptno, sal desc;

-- p92 Q2
select distinct job from emp order by job desc;


-- where --
-- where : if���� ���, �ش� ������ �����Ǵ� �͸� ���
select * from emp
where deptno = 30; -- �μ���ȣ(deptno)�� 30�� �͵鸸 ���

-- �����ȣ(empno)�� 7782�� ��
select * from emp where empno = 7782;
-- ����(sal)�� 2000�̻��� ��
select * from emp where sal >= 2000 order by sal;
-- Ȧ����ǥ ���!
select * from emp where ename = 'KING';

-- and = &&
select * from emp where deptno = 30 and job = 'SALESMAN';
select * from emp where job = 'CLERK' and deptno = 30;

-- or = ||
select * from emp where job = 'CLERK' and deptno = 30 or deptno = 20;
-- �켱���� �Ű澲��!
select * from emp where job = 'CLERK' and (deptno = 30 or deptno = 20);

select * from emp where sal >= 2000 and sal < 3000 order by sal;

-- !=, ^=, <> ��� ���� �ʴٴ� ����( <>�� ���� ���� ���)
select * from emp where sal != 3000;
select * from emp where sal ^= 3000;
select * from emp where sal <> 3000;

-- �� ���� ��� ���� ����( not ��� )
select * from emp where sal < 2000 or sal >= 3000;
select * from emp where not(sal >= 2000 and sal < 3000);

-- or or or... ������ �� in ����ϸ� ��� ����
select * from emp where job in ('MANAGER', 'SALESMAN', 'CLERK');
-- in �տ� not �ٿ��ֱ�
select * from emp where job not in ('MANAGER', 'SALESMAN', 'CLERK');

-- between : �� ���� �� ���� ���̰��ΰ͵� ���
select * from emp where sal between 2000 and 3000;


-- like --
-- % : ���ϵ� ī��, ���� ��� ���� ��� ���� ������, ���� ���� ��쵵 ����
-- S�� �����ϴ� �͵� ���
select * from emp where ename like 'S%';
select * from emp where ename like 'A%';

-- _ : ���ϵ� ī��, �� �� ���� ���� ������
-- �ι�° ���ڰ� L �ΰ͸� ���
select * from emp where ename like '_L%';
-- 4���ڸ� ���( _ 4�� )
select * from emp where ename like '____';

-- �߰��� AM�� �ִ� �� ã��
select * from emp where ename like '%AM%';

select * from emp where comm <= 400;


-- null --
-- is null : null �� �͸� ���
select * from emp where comm is null;

-- is not null : null �ƴ� �͸� ���
select * from emp where comm is not null;

-- emp����  deptno�� 10 �Ǵ� 20�� ����� empno, ename, sal, deptno ���
-- ��� 1
select empno, ename, sal, deptno from emp where deptno = 10 or deptno = 20;
-- ��� 2
select empno, ename, sal, deptno from emp where deptno in (10, 20);


-- union --
-- union : ���̺� ����, �߰��� ; ��� union ���
-- ��, ��ȸ�� �÷��� ����, Ÿ�� ���ƾ���
select empno, ename, sal, deptno from emp where deptno = 10
union
select empno, ename, sal, deptno from emp where deptno = 20;

-- union : �ߺ��� �ڷ� ����
select empno, ename, sal, deptno from emp where deptno = 10
union
select empno, ename, sal, deptno from emp where deptno = 10;

-- union all : �ߺ��Ǵ� �ͱ��� �� ����, �ǹ����� �� ���� ���
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
    
    
-- �Լ� -- 
-- upper : �빮��
-- lower : �ҹ���
-- initcap : ù���ڸ� �빮��, ���� �ҹ���
select ename, upper(ename), lower(ename), initcap(ename) from emp;

-- upper, lower : ��ҹ��� ���� ���� like�� �� ����ϱ� ����
select * from emp where lower(ename) like lower('%Mi%');


-- length : ����
select ename, length(ename) from emp;

select * from emp where length(ename) >= 5;

-- dual : �ӽ� ���̺�, ������
-- length : ���� ũ��
-- lengthb : byte ũ�� (�߿�X)
select length('��'), lengthb('��') from dual;

-- substr(����� �Ǵ� ����, ���� ��ġ, ������ ����)
-- substr(job, 1, 2) : ù��° ���ڿ��� 2�ڸ�
-- -������ �ڿ�������
-- ������ ������ ���ų� �ʹ� ũ�ٸ� ������ ���
-- ���ڿ� length ��� ����
-- lower, upper ��� ���� -> ���ڷ� �����ֱ� ����
select job, 
    substr(job, 1, 2), 
    substr(job, 0, 2), 
    substr(job, 3, 3), 
    substr(job, 5), 
    ename, 
    substr(job, -3, 2),
    lower(substr(job, 5, 100))
from emp;

-- replace : ���� �ٲٱ�
-- replace (����� �Ǵ� ����, �ٲ� ����, ��ü�� ����)
select job, replace(job, 'A', '*') from emp;

select job, 
    length(job), 
    length(job) / 2, 
    substr(job, (length(job)+1) / 2, 1),
    replace(job, substr(job, (length(job)+1) / 2, 1), '*')
from emp;

-- lpad(rpad) : �������� ���̸� ������ �� ���� ����� ����(������)�� ���ڷ� ä��
-- lpad(����� �Ǵ� ����, ��ü �ڸ���, ä�� ����)
select job, lpad(job, 10, '#'), lpad(job, 4, '#') from emp;

select job, length(job), 15-length(job) from emp;

select lpad(job, (15-length(job))/2 + length(job), '#') from emp;

-- || : ���ڿ� ���ϱ�
select empno || ename || '��' from emp;

-- trim : �� �� ���� ����, �� �۾� ������ ������ �������� ����
select '    a   b    c      ', trim('    a   b    c      ') from dual;

-- �ǽ� 1 --
-- �ֹι�ȣ ���ڸ� ����ŷ
select '210621-3123456', 
    rpad((substr('210621-3123456', 1, 8)), length('210621-3123456'), '*')
from dual;

-- �ǽ� 2 -- 
-- ����� �̸��� �տ� ���ڸ��� ���̰� �ϰ� �������� *�� ǥ��
-- �ǽ� 3 --
-- �ձ��� �ϳ��� *
-- �ǽ� 4 --
-- �ι�° �۾��� *
-- �ǽ� 5 --
-- ��� �۾��� *
select 
    ename,
    rpad(substr(ename, 1, 2), length(ename), '*') as �ǽ�2,
    lpad(substr(ename, 2), length(ename), '*') as �ǽ�3,
    rpad(rpad(substr(ename, 1, 1), 2, '*'), length(ename), substr(ename, 3)) as �ǽ�4,
    rpad
    (rpad(substr(ename,1 ,length(ename)/2-0.5), length(ename)/2+0.5, '*'), 
    length(ename), 
    substr(ename, length(ename)/2+1.5)) as �ǽ�5
from emp;

-- �ι�° �۾��� *
-- ex. WARD -> W*RD
select 
    ename,
    substr(ename, 1, 1),
    substr(ename, 3),
    rpad(substr(ename, 1, 1), 2, '*'),
    rpad(rpad(substr(ename, 1, 1), 2, '*'), length(ename), substr(ename, 3))
from emp;

-- ��� �۾��� *
-- ex. MARTIN -> MA*TIN
select 
    ename,
    substr(ename,1 ,length(ename)/2-0.5) as str,
    substr(ename, length(ename)/2+1.5) as str2,
    rpad(substr(ename,1 ,length(ename)/2-0.5), length(ename)/2+0.5, '*') as rpad,
    rpad
    (rpad(substr(ename,1 ,length(ename)/2-0.5), length(ename)/2+0.5, '*'), 
    length(ename), 
    substr(ename, length(ename)/2+1.5)) as �ǽ�5
from emp;

-- �ǽ� 5 ���ܹ���
select 
    substr(ename,1 ,length(ename)/2-0.5) || '*' || substr(ename, length(ename)/2+1.5) as �ǽ�5_����
from emp;


-- ���� ���� -- 
-- trunc : Ư�� ��ġ���� ����
-- trunc( ����, ���� ���� ), �� ��° �������� �� ���� �Ҽ��� ���Ϸ� �� ����
select 
    trunc(1234.5678), -- 1234
    trunc(1234.5678, 2), -- 1234.56
    trunc(1234.5678, -2), -- 1200
    trunc(-12.34) -- -12
from dual;

-- ceil : �ø�
-- floor : ����
select 
    ceil(3.14), // 4
    floor(3.14), // 3
    ceil(-3.14), // -3
    floor(-3.14) // -4
from dual;


-- ��¥ ������ --
-- sysdate : ���� ����Ŭ pc�� �ð�
-- ���� pc�� �ѱ� �ð��� 9�ð� ���� ����( ���� ���� �ð����� �Ǿ����� )
-- ��¥ ���� �� �Ϻθ� select�� ǥ��
select 
    sysdate, -- 24/06/24
    sysdate + 1, -- 24/06/25
    sysdate - 1, -- 24/06/23
    sysdate + 8 -- 24/07/02
from dual;

-- �÷��� + �� ����ϸ� ��� ���ڷ� �����Ͽ� ����
-- || ���ڵ� ���ڷ� �����Ͽ� ����
-- to_char : ��¥ -> ����
select 
    to_char(sysdate, 'YYYY"��" MM"��" DD"��" HH24"��" MI"��" SS"��"')
from dual;

-- to_date : ���� -> ��¥
-- ��¥�� �־��� ��� �ð��� �ڵ����� 0�÷� ��
select 
    sysdate - to_date('2024-05-07', 'yyyy-mm-dd')
from dual;

-- nvl : ���࿡ null�̶�� �ι�° ���ڷ� ��ü�ض�
select 
    comm, 
    nvl(comm, -1),
    sal,
    sal + comm,
    sal + nvl(comm, 0)
from emp;

select * from emp
where comm = 0 or comm is null;
-- ���Ʒ� �ڵ�� ���� ��� ���� ����
select * from emp
where nvl(comm, 0) = 0;


-- case : if�� ����~
select
    comm,
    case
    -- �÷��� ������ ���� ���̿����� -> comm �� �����̱� ������ �� ���߱� ���� ���ڷ� ��ȯ
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
    to_char(next_day((add_months(hiredate, 3)), '������'), 'yyyy-mm-dd') as R_JOB_mon,
    nvl(to_char(comm), 'N/V') as COMM
from emp;

-- p 175 Q4
-- ��� 1
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

-- ��� 2
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

-- ��� 3
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

-- ��� 4
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

-- ��� 5
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



-- ������ �Լ�(�����Լ�) --
-- ��µ� �� ���� ������ �ٸ��� ����, �� ���̸� �� �ٸ� ���� ���;���
-- count : null�� ���Ե��� ����
-- -> *�� ���� ���� �������̱⿡ *�� ���� ��
select sum(sal), count(sal), count(*), count(comm) from emp;

-- Ư�� �ܾ ���� �� ���� ����
select * from emp 
where ename like '%A%';
select count(*) from emp 
where ename like '%A%';

select max(sal), max(ename), min(hiredate), min(comm), avg(sal) from emp;

-- �μ��� �μ� ���� �� ��, ��� ǥ��
select sum(sal), avg(sal) from emp
where deptno = 10
union all
select sum(sal), avg(sal) from emp
where deptno = 20
union all
select sum(sal), avg(sal) from emp
where deptno = 30;


-- group by : ���� �����͸� ������
-- group by�� �ִ� select : group by �� ���̳� ������ �Լ�(���� �Լ�)�� �� �� ����
select deptno, avg(sal), sum(sal), count(*) from emp
group by deptno;

select deptno, empno from emp
group by deptno, empno;

select deptno, job, count(*)
from emp
group by deptno, job
order by deptno, job;

-- having : group by������ ���
-- �����Լ��� �������� �ɰ� ���� ��(where ���) ���
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
    
    
-- �����ȣ ���ڸ� 2�� ���� ����ŷ
select 
    empno,
    substr(empno, 1, 2),
    rpad(substr(empno, 1, 2), length(empno), '*')
from emp;

select * from dept;


-- ���� ����
/* 5 */ select job, count(*) as cnt
/* 1 */ from emp 
/* 2 */ where sal > 1000 
/* 3 */ group by job
/* 4 */ having count(*) >= 3
/* 6 */ order by cnt desc;

select * from emp, dept order by empno;

-- ���̺� �� �� �̻� ��ȸ�� �� ����(where)�� �� �˷���� ���ϴ� ������ ��µȴ�
-- ��ü ���̺� �� - 1���� ������ ����
select * from emp, dept
where emp.deptno = dept.deptno
order by empno;

-- ���̺�� ��Ī(as �� ��)
select *
from emp e, dept d
where e.deptno = d.deptno;

-- *�� �÷��� ���� �� ��� *�� ���̺��� �����������(�ܵ� ����)
select e.ename, d.*
from emp e, dept d
where e.deptno = d.deptno;

select * from salgrade;

select * from emp e, salgrade s
where s.losal <= e.sal and s.hisal >= e.sal ;

-- null�� �����ʹ� ���� �Ұ�
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename from emp e1, emp e2
where e1.mgr = e2.empno;


-- using : ���� �÷����� �ִ� ��쿡�� �� �� ����
select * from emp join dept using (deptno);


select * from emp join dept on (emp.deptno = dept.deptno);

select * from emp e1 join emp e2 on (e1.mgr = e2.empno);


-- left outer join : ������ ���̺��� ������ ��� ��µǴ� �� ����(null ����)
select * from emp e1 left outer join emp e2 on (e1.mgr = e2.empno);

select * from emp e1 right outer join emp e2 on (e1.mgr = e2.empno);

-- from�� , �Ἥ ���̺� ����, �� ������ ������ �������� ���� left out join ���, on���� ���� �ֱ�

select * from emp;
select * from dept;
select * from salgrade;

-- �ǽ� 1
-- empno, ename, dname, loc ��� : ��� 14��
-- ��� 1 - where
select empno, ename, dname, loc from emp e, dept d
where e.deptno = d.deptno 
order by e.deptno;
-- ��� 2 - using
select empno, ename, dname, loc 
from emp 
join dept using (deptno) 
order by deptno;
-- ��� 3 - left outer join
select empno, ename, dname, loc 
from emp e 
left outer join dept d on (e.deptno = d.deptno)
order by e.deptno;

-- �ǽ� 2
-- ���, �̸�, �μ���, �޿���� ���
-- ��� 1 - where
select empno, ename, dname, grade from emp e, dept d, salgrade s
where (e.deptno = d.deptno) 
and (e.sal >= s.losal and e.sal <= s.hisal)
order by grade;
-- ��� 2 - join
select empno, ename, dname, grade 
from emp e 
join dept d on (e.deptno = d.deptno) 
join salgrade s on (e.sal >= s.losal and e.sal <= s.hisal)
order by grade;
-- ��� 3 - left outer join
select empno, ename, dname, grade 
from emp e
left outer join dept d on (e.deptno = d.deptno)
left outer join salgrade s on (e.sal >= s.losal and e.sal <= s.hisal)
order by grade;
-- ��� 4 - using + where
select empno, ename, dname, grade 
from salgrade s, emp e 
join dept d using (deptno) 
where e.sal >= s.losal and e.sal <= s.hisal
order by grade;

-- �ǽ� 3
-- �Ŵ������� ������ ���� ����� �̸�, �޿�, �Ŵ��� �̸�, �Ŵ��� �޿�
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


-- �������� -- 
select sal from emp where ename = 'JONES'; -- 2975

select * from emp
where sal > (select sal from emp where ename = 'JONES');

-- ��� �޿����� �� ���� �޴� ���
select avg(sal) from emp;

select * from emp
where sal > (select avg(sal) from emp);

-- blake������ ���� ������ �޴� �����
select sal from emp where ename = 'BLAKE';

select * from emp
where sal > (select sal from emp where ename = 'BLAKE');

-- jones���� ���� job�� ������ �ִ� �����
select job from emp where ename = 'JONES';

select * from emp 
where job = (select job from emp where ename = 'JONES');


select max(sal) from emp group by deptno;

select * from emp 
where sal in (select max(sal) from emp group by deptno);

