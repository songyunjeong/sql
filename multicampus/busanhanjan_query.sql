-- 1. '금정구'에서 별점 4.5점 이상인 가게 검색
SELECT pno, pname, place, tel, star
FROM pub
WHERE place LIKE '%금정%' AND star >= 4.5;

-- 2. 가게 '몰틀리' 정보 검색
SELECT pname, star, place, tel
FROM pub
WHERE pname LIKE '%몰틀리%';

-- 3. 도수가 12 이상인 와인 검색
SELECT manufacturer, aname, degree
FROM alcohol
WHERE category = '와인' AND degree >= 12;