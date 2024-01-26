# Data-Exploration
Real time Covid 19 data is used to bring insights into the analysis where
two tables are created differentiating the covid deaths and covid vaccinations_
More insights in analysisng the cases vs deaths, cases vs population_
Consideration of global numbers has been done to know the country with highest death counts and infection rates,
further to understand the vaccination effect, population vs vaccinations and the percent of population vaccinated is run by forming CTE


I'm going to look at global COVID-19 information. I began with two Excel files called "covid deaths" and "covid vaccinations." All the data was in one file with over 0.3 million rows. I split the data into two tables, naming them "covid deaths" and "covid vaccinations." There were more than 30 columns. I got rid of unnecessary columns, found and removed any empty spaces. After that, I moved the data to Google BigQuery to ask questions and study the information.





I began by choosing specific data from the deaths table that I consistently used throughout the entire process. This selected data included information such as location, date, new cases, total cases, total deaths, and population. I organized this data by location and date.



Next, I computed the ratio of total deaths to total cases to determine the percentage of individuals who passed away after contracting COVID-19. I labeled the resulting column as "death percentage." Applying a WHERE clause for the location 'India,' I found that as of 2023, the likelihood of dying after contracting COVID-19 was 1.2%.




