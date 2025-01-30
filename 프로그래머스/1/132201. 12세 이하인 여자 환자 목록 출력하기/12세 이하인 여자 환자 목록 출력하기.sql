-- 코드를 입력하세요
SELECT PT_NAME, PT_NO, GEND_CD, AGE, nvl(tlno, 'NONE')
FROM PATIENT
WHERE AGE <= 12
AND gend_cd = 'W'
order by age desc, pt_name asc