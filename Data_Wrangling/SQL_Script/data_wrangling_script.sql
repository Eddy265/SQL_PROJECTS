CREATE TABLE clean_unicorn (Company varchar (100),
							  Valuation_B$ VARCHAR (20),
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
							  Portfolio_Exits varchar (50)
						   );

COPY clean_unicorn FROM 'C:/Users/euzoe/OneDrive/Desktop/DATA_ANALYSIS/MY_PROJECTS/SQL/SQL_PROJECTS/Data_Wrangling/Raw_Data/Unicorn_Companies.csv' WITH (FORMAT CSV, HEADER true)


SELECT * FROM clean_unicorn where company = 'Weilong'

SELECT founded_year FROM clean_unicorn WHERE NOT (founded_year LIKE '19%' or founded_year LIKE '20%');

--NO 1
--Clean founded_year column
-- Step 1: Replace "none" values with NULL
UPDATE clean_unicorn
SET founded_year = null
WHERE founded_year = 'None';

-- Step 2: Alter the data type of the founded_year column to DATE
ALTER TABLE clean_unicorn
ALTER COLUMN founded_year TYPE int USING (NULLIF(founded_year, '')::int);

--NO 2
--clean valuation column
UPDATE clean_unicorn
SET Valuation_b$ = REPLACE(Valuation_B$, '$', '')
WHERE Valuation_b$ LIKE '%$%';

--change data type (and convert it to proper value of billion)
ALTER TABLE clean_unicorn
ALTER COLUMN Valuation_B$ TYPE float USING (NULLIF(Valuation_B$, '')::float)  --* 1000000000;

--NO 3
--Clean date joined column
UPDATE clean_unicorn
SET Date_joined = TO_CHAR(TO_DATE(Date_joined, 'MM/DD/YYYY'), 'YYYY-MM-DD');
-- Step 2: Alter the data type of the Date_joined column to DATE
ALTER TABLE clean_unicorn
ALTER COLUMN Date_joined TYPE date USING (NULLIF(Date_joined, '')::date);

--NO 4
--CLEAN total_raised column
select * from clean_unicorn


-- SECOND remove $ symbol
UPDATE clean_unicorn
SET Total_Raised = REPLACE(Total_Raised, '$', '')
WHERE Total_Raised LIKE '%$%';


select * from clean_unicorn where Total_Raised = 'None'

--THIRD convert to million and billion
UPDATE clean_unicorn
SET Total_Raised =
    CASE
        WHEN Total_Raised = 'None' THEN NULL
        WHEN Total_Raised LIKE '%B' THEN CAST(REPLACE(Total_Raised, 'B', '') AS DECIMAL) * 1000000000
        WHEN Total_Raised LIKE '%M' THEN CAST(REPLACE(Total_Raised, 'M', '') AS DECIMAL) * 1000000
		END;

--FOURTH CHANGE THE DATA TYPE TO NUMERIC
ALTER TABLE clean_unicorn
ALTER COLUMN Total_Raised TYPE DECIMAL  USING (NULLIF(Total_Raised, '')::DECIMAL);


--NORMALIZE THE TABLE
--FIRST
--create the company table
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

--Add the column founded_year to the company table
ALTER TABLE company add column founded_year int;

UPDATE Company AS c
SET founded_year = cu.founded_year
FROM clean_unicorn AS cu
WHERE c.Company = cu.Company;

--add companyid to the main table; clean_unicorn
ALTER TABLE clean_unicorn ADD CompanyID INTEGER;

--and insert the ids
UPDATE clean_unicorn AS cu
SET CompanyID = c.CompanyID
FROM Company AS c
WHERE cu.Company = c.Company;

--Add the column Financial_stage to the company table
ALTER TABLE company ADD financial_stage varchar(50);

UPDATE Company AS c
SET financial_stage = cu.financial_stage
FROM clean_unicorn AS cu
WHERE c.Companyid = cu.Companyid;

--Add the column InvestorsCount to the company table
ALTER TABLE company ADD InvestorsCount int;
--change the data type of Investors_count in the clean_unicorn to integer
--first set None to null
UPDATE clean_unicorn
SET investors_count = null
WHERE investors_count = 'None'
--second, change the data type
ALTER TABLE clean_unicorn
ALTER COLUMN investors_count TYPE int USING (NULLIF(investors_count, '')::int);
--Now update the InvestorsCount table in the Investors table from the clean_unicorn table
UPDATE company AS c
SET InvestorsCount = cu.Investors_count
FROM clean_unicorn AS cu
WHERE c.Companyid = cu.Companyid;


--Add the column Deal_Terms to the company table
ALTER TABLE company ADD DealTerms int;
--change the data type of Investors_count in the clean_unicorn to integer
--first set None to null
UPDATE clean_unicorn
SET deal_terms = null
WHERE deal_terms = 'None'
--second, change the data type
ALTER TABLE clean_unicorn
ALTER COLUMN deal_terms TYPE int USING (NULLIF(deal_terms, '')::int);
--Now update the company table from the clean_unicorn table
UPDATE company AS c
SET DealTerms = cu.deal_terms
FROM clean_unicorn AS cu
WHERE c.Companyid = cu.Companyid;


--Add the column Portfolio_exits to the company table
ALTER TABLE company ADD PortfolioExits int;
--change the data type of Investors_count in the clean_unicorn to integer
--first set None to null
UPDATE clean_unicorn
SET portfolio_exits = null
WHERE portfolio_exits = 'None'
--second, change the data type
ALTER TABLE clean_unicorn
ALTER COLUMN portfolio_exits TYPE int USING (NULLIF(portfolio_exits, '')::int);
--Now update the company table from the clean_unicorn table
UPDATE company AS c
SET PortfolioExits = cu.portfolio_exits
FROM clean_unicorn AS cu
WHERE c.Companyid = cu.Companyid;


--SECOND
-- Create Valuation Table
CREATE TABLE Valuation (
    ValuationID SERIAL PRIMARY KEY,
    CompanyID INTEGER REFERENCES Company(CompanyID),
    Valuation_$B float(20),
    Financial_Stage VARCHAR(20)
);

-- Insert data from clean_unicorn and company into Valuation
INSERT INTO Valuation (CompanyID, Valuation_$B)
SELECT c.CompanyID, cu.Valuation_B$
FROM Company c
JOIN clean_unicorn cu ON c.Company = cu.Company;

--Add the column total_raised to the valuation table
ALTER TABLE valuation ADD Total_Raised DECIMAL(18, 2);
--Now update the valuation table from the clean_unicorn table
UPDATE valuation AS c
SET Total_Raised = cu.Total_Raised
FROM clean_unicorn AS cu
WHERE c.Companyid = cu.Companyid;


--THIRD
-- Create Investor Table
CREATE TABLE Investor (
    InvestorID SERIAL PRIMARY KEY,
    InvestorName VARCHAR(250),
    CompanyID INTEGER REFERENCES Company(CompanyID)
);


-- Insert data into Investor (InvestorName, CompanyID)
INSERT INTO Investor (InvestorName, CompanyID)
SELECT UNNEST(string_to_array(Select_investors, ', ')), c.CompanyID
FROM clean_unicorn c
WHERE Select_investors IS NOT NULL;

--FOURTH
--Create industry table
CREATE TABLE industry (
	industryid serial PRIMARY KEY,
	industry VARCHAR (250),
	CompanyID INTEGER REFERENCES Company(CompanyID)
)

-- Insert data into industry (industry, CompanyID) from the clean_unicorn table
INSERT INTO industry (industry, CompanyID)
SELECT UNNEST(string_to_array(industry, ', ')), c.CompanyID
FROM clean_unicorn c
WHERE industry IS NOT NULL;

--replace where & started the industry name with nothing
UPDATE industry
SET industry = REPLACE(industry, '& ', '')
WHERE industry LIKE '&%';