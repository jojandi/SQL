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


