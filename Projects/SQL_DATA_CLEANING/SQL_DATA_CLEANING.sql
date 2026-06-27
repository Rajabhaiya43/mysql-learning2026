-- DATA Cleaning


SELECT *
FROM company_fund
ORDER BY company ASC;

-- 1. REMOVING DUPLICATE
-- 2. STANDARDIZE THE DATA
-- 3. NULL VALUE OR BLANK VLAUE
-- 4. REMOVE UNNECESSARY ROW-COLUMNS


-- STEP - 01 { CREATE A NEW CLONE TABLE)

CREATE TABLE company_fund_clone
LIKE company_fund;

-- STEP - 02 { INSERTING ALL DATE IN CLONE TABLE)

INSERT Company_fund_clone
SELECT*
FROM company_fund;

-- Company_fund_clone 
SELECT *
FROM company_fund_clone;

--  STEP - 03 { REMOVE DUPLICATE DATA FROM TABLE)
 
 #STEP 01 USING ROW NUMBWER AS THERE IS NO UNIQE IDENDTY IS GIVEN LIKE ID OR SOMETHING
 
 SELECT *,
ROW_NUMBER() OVER (PARTITION BY
company,
industry,
total_laid_off,
percentage_laid_off,
`date`,
stage,
funds_raised_millions
) AS ROW_ID
FROM company_fund_clone
ORDER BY ROW_ID DESC;

 #STEP 01 checking the duplicated using the CTEs
 
 WITH DUPLICATE_DATA_CTE AS
 (
 SELECT *,
ROW_NUMBER() OVER (PARTITION BY
company,
industry,
total_laid_off,
percentage_laid_off,
`date`,
stage,
funds_raised_millions
) AS ROW_ID
FROM company_fund_clone
)

SELECT *
FROM DUPLICATE_DATA_CTE
WHERE ROW_ID > 1;

#STEP 02 USING CREATING NEW TABLE TO REMOVE DUPLICATE VIA ROW_ID 
CREATE TABLE `NO_DUP_DATA` (
`company` text, 
`location` text,
`industry` text,
`total_laid_off` int, 
`percentage_laid_off` text, 
`date` text,
`stage` text, 
`country` text, 
`funds_raised_millions` int,
`row_id` int
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#STEP 03 ADD ALL DATE TO NEW TABLE
INSERT INTO NO_DUP_DATA
SELECT *,
ROW_NUMBER() OVER (PARTITION BY
company,
industry,
total_laid_off,
percentage_laid_off,
`date`,
stage,
funds_raised_millions
) AS ROW_ID
FROM company_fund_clone;
#STEP 4 DELETE DUPLICTE DATE 
DELETE
FROM NO_DUP_DATA
WHERE row_id > 1;

SELECT*
FROM NO_DUP_DATA
WHERE row_id > 1;

-- DONE ( DUPLICATED DATA IS REMOVED)

-- CHECKING FOR UNUSUAL SAPCE BEFOR TEXT 

SELECT*
FROM NO_DUP_DATA;

SELECT company , TRIM(company)
FROM NO_DUP_DATA;

UPDATE NO_DUP_DATA
SET company = TRIM(company);


-- CONVERTING  DATA WHICH LOOKS LIKE SIMLIER 
SELECT DISTINCT industry
FROM NO_DUP_DATA
ORDER BY 1;

SELECT*
FROM NO_DUP_DATA
WHERE industry LIKE 'Crypto%'
;

UPDATE NO_DUP_DATA
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT location
FROM NO_DUP_DATA
ORDER BY 1;

SELECT DISTINCT country
FROM NO_DUP_DATA
ORDER BY 1;

SELECT*
FROM NO_DUP_DATA
WHERE country LIKE 'United States.'
;

UPDATE NO_DUP_DATA
SET country = 'United States'
WHERE country LIKE 'United States.'
;

SELECT `date`
FROM NO_DUP_DATA
ORDER BY 1;

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM NO_DUP_DATA;

UPDATE NO_DUP_DATA
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE NO_DUP_DATA
MODIFY COLUMN `date` DATE;

-- REMOVING NULL AND BLANK 

SELECT *
FROM NO_DUP_DATA
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

-- CHECKING FOR MISSINGB OR BLANK DATA 



