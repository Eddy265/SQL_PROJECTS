CREATE TABLE clean_unicorn (Company varchar (100),
							  Valuation VARCHAR (20),
							  Date_joined VARCHAR (20),
							  Country char (50),
							  City char (50),
							  Industry VARCHAR (100),
							  Select_investors VARCHAR (250),
							  Founded_year varchar (20),
							  Total_Raised varchar (20),
							  Financial_Stage VARCHAR (20),
							  Investors_Count VARCHAR (20),
							  Deal_Terms VARCHAR (20),
							  Portfolio_Exits varchar (50))

COPY clean_unicorn FROM 'C:/Users/euzoe/OneDrive/Desktop/DATA_ANALYSIS/BOOTCAMP/NISIG/Unicorn_Companies.csv' WITH (FORMAT CSV, HEADER true)


SELECT * FROM clean_unicorn 

--clean founded_year
-- Step 1: Replace "none" values with NULL
UPDATE clean_unicorn
SET founded_year = 0
WHERE founded_year = 'None';

-- Step 2: Alter the data type of the founded_year column to DATE
ALTER TABLE clean_unicorn
ALTER COLUMN founded_year TYPE int USING (NULLIF(founded_year, '')::int);


--clean valuation
UPDATE clean_unicorn
SET Valuation = REPLACE(Valuation, '$', '')
WHERE Valuation LIKE '%$%';

--change data type
ALTER TABLE clean_unicorn
ALTER COLUMN Valuation_$B TYPE float USING (NULLIF(Valuation_$B, '')::float);

--Clean date joined
UPDATE clean_unicorn
SET Date_joined = TO_CHAR(TO_DATE(Date_joined, 'MM/DD/YYYY'), 'YYYY-MM-DD');
-- Step 2: Alter the data type of the Date_joined column to DATE
ALTER TABLE clean_unicorn
ALTER COLUMN Date_joined TYPE date USING (NULLIF(Date_joined, '')::date);

--clean total_raised
ALTER TABLE clean_unicorn ADD Cleaned_Total_Raised DECIMAL(18, 2);

UPDATE clean_unicorn
SET Cleaned_Total_Raised =
    CASE
        WHEN Total_Raised = 'None' THEN NULL
        WHEN Total_Raised LIKE '$%B' THEN CAST(REPLACE(Total_Raised, '$', '') AS DECIMAL) * 1000000000
        WHEN Total_Raised LIKE '$%M' THEN CAST(REPLACE(Total_Raised, '$', '') AS DECIMAL) * 1000000
        WHEN Total_Raised ~ '^\d+\.\d+[M]$' THEN CAST(REPLACE(REPLACE(Total_Raised, '$', ''), 'M', '') AS DECIMAL) * 1000000
        ELSE CAST(REPLACE(REPLACE(Total_Raised, '$', ''), 'M', '') AS DECIMAL) * 1000000
    END;





SELECT DISTINCT(total_raised) from clean_unicorn where total_raised is null




UPDATE clean_unicorn
SET Total_Raised =
    CASE
        WHEN Total_Raised LIKE '$%B' THEN REPLACE(Total_Raised, '$', '')::NUMERIC * 1000000000
		end
		
        WHEN Total_Raised LIKE '$%M' THEN REPLACE(Total_Raised, '$', '')::NUMERIC * 1000000
		WHEN Total_Raised LIKE '%M' THEN REPLACE(Total_Raised, '$', '')::NUMERIC * 1000000
        ELSE REPLACE(Total_Raised, '$', '')::NUMERIC
    END;



SELECT * FROM clean_unicorn 






--NORMALIZE THE TABLE
--first create the company table
CREATE TABLE Company (
    CompanyID SERIAL PRIMARY KEY,
    Company VARCHAR(100),
    Date_joined DATE,
    Country VARCHAR (50),
    City VARCHAR (50)
);

--insert into company
INSERT INTO Company (Company, Date_joined, Country, City)
SELECT Company, Date_joined, Country, City
FROM clean_unicorn;

--second
-- Create Valuation Table
CREATE TABLE Valuation (
    ValuationID SERIAL PRIMARY KEY,
    CompanyID INTEGER REFERENCES Company(CompanyID),
    Valuation_$B float(20),
    Financial_Stage VARCHAR(20)
);

-- Insert data from clean_unicorn and company into Valuation
INSERT INTO Valuation (CompanyID, Valuation_$B, Financial_Stage)
SELECT c.CompanyID, cu.Valuation_$B, cu.Financial_Stage
FROM Company c
JOIN clean_unicorn cu ON c.Company = cu.Company;


-- Create Investor Table
CREATE TABLE Investor (
    InvestorID SERIAL PRIMARY KEY,
    InvestorName VARCHAR(250),
    CompanyID INTEGER REFERENCES Company(CompanyID)
);

--add companyid to the main table; clean_unicorn
ALTER TABLE clean_unicorn ADD CompanyID INTEGER;

--and insert the ids
UPDATE clean_unicorn AS cu
SET CompanyID = c.CompanyID
FROM Company AS c
WHERE cu.Company = c.Company;

-- Insert data into Investor (InvestorName, CompanyID)
INSERT INTO Investor (InvestorName, CompanyID)
SELECT UNNEST(string_to_array(Select_investors, ', ')), c.CompanyID
FROM clean_unicorn c
WHERE Select_investors IS NOT NULL;








select * from company c
join investor i on c.companyid = i.companyid
where c.company = 'FTX'




drop table valuation
select * from Investor






