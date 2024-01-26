# Data-Exploration


I'm going to look at global COVID-19 information. I began with two Excel files called "covid deaths" and "covid vaccinations." All the data was in one file with over 0.3 million rows. I split the data into two tables, naming them "covid deaths" and "covid vaccinations." There were more than 30 columns. I got rid of unnecessary columns, found and removed any empty spaces. After that, I moved the data to Google BigQuery to ask questions and study the information.





I began by choosing specific data from the deaths table that I consistently used throughout the entire process. This selected data included information such as location, date, new cases, total cases, total deaths, and population. I organized this data by location and date.



Next, I computed the ratio of total deaths to total cases to determine the percentage of individuals who passed away after contracting COVID-19. I labeled the resulting column as "death percentage." Applying a WHERE clause for the location 'India,' I found that as of 2023, the likelihood of dying after contracting COVID-19 was 1.2%.



 
Then the total cases vs population. This calculation aimed to determine the percentage of the population affected by COVID-19, considering the ratio of total cases to the population. The resulting column was named "population percentage." Using a WHERE clause for the location 'India,' it was interesting to find that in 2023, out of a population of 1.4 billion people, approximately 3.17% were affected by COVID-19.


When examining countries with the highest infection rates relative to their population, I focused on location, population, and total cases. Using the max function for both total cases and population percentage, I employed a GROUP BY statement to group the data by population and location. Additionally, I used an ORDER BY statement for the population percentage. Notably, Cyprus was the most affected, with a 73% infection rate relative to its population on a global scale.




In identifying countries with the highest death count, I utilized location and the maximum total deaths, labeled as "total death count." However, due to a data type issue, I had to convert the total deaths into integers using CAST. The initial result displayed a mixture of countries and continents. To address this, I applied a WHERE clause, specifying that continents should not be null, thus excluding continents from the list of countries.


To obtain global figures, I calculated the sum of new cases and new deaths worldwide. Additionally, I determined the percentage rate of people who died globally by dividing the new deaths by the new cases.


Using the vaccination table

In comparing total population to vaccinations, I employed a join operation for both the "deaths" and "vaccinations" tables, using date and location as common parameters. The selected columns included location, date, population, and vaccinations. To track the rolling count of people vaccinated, I incorporated the "PARTITION BY" clause. Additionally, I utilized a WHERE clause for filtering and an ORDER BY clause to maintain organizational structure in the results.

I implemented the previous query and introduced a WITH clause to create a temporary Common Table Expression (CTE). The purpose of this CTE is to simplify complex queries. Initially, an error occurred because I overlooked removing the ORDER BY clause for the CTE. However, after rectifying this issue, I successfully obtained the results for the rolling count of vaccinated people, including the cumulative percentage for each row as we scroll down.

