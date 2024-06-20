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

-- null�� �����ϸ� �� ���� ������ null
select ename, sal, sal*12+comm, comm from emp;

-- as "" : �÷��� ��Ī
-- "" ���� ���� ��, ���Ⱑ �ִٸ� �ʼ�(�����ϸ� ���⺸�� _ ����)
-- as ���� ����
select ename, sal, sal*12+comm as "new_sal", comm from emp;

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

