--covid_deaths

SELECT * 
FROM Project_portfolio.covid_deaths



--looking at the total cases vs total deaths

SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_percentage
FROM Project_portfolio.covid_deaths
WHERE Location = 'United States'
ORDER BY 1,2





--Looking at total cases vs population


SELECT Location, date, total_cases, population, (total_cases/population)*100 as percentage
FROM Project_portfolio.covid_deaths
WHERE Location = 'India'
ORDER BY 1,2




--Looking at countries with highest infection rates

SELECT Location, population,MAX(total_cases) as highest_infected_count, MAX((total_cases/population))*100 as percentage_infected_country
FROM Project_portfolio.covid_deaths
GROUP BY Location, population
ORDER BY percentage_infected_country DESC

-- countries with highest death rates


SELECT Location,MAX(total_deaths) as total_death_counts 
FROM Project_portfolio.covid_deaths
WHERE continent is not null
GROUP BY Location
ORDER BY total_death_counts DESC


--lets break thing down by continents


SELECT continent, MAX(total_deaths) as total_death_counts 
FROM Project_portfolio.covid_deaths
WHERE continent is not null
GROUP BY continent
ORDER BY total_death_counts DESC


--showing the continents with highest deaths


SELECT continent,MAX(total_deaths) as total_death_counts 
FROM Project_portfolio.covid_deaths
WHERE continent is not null
GROUP BY continent
ORDER BY total_death_counts DESC


--global numbers


SELECT date, SUM(total_cases) as total_cases, SUM(total_deaths) as total_deaths,SUM(total_cases)/SUM(total_deaths) as death_percentage
FROM Project_portfolio.covid_deaths
WHERE continent is not null
GROUP BY date
ORDER BY 1,2


--covid_vaccinations


SELECT *
FROM Project_portfolio.covid_vaccinations


--looking at total population vs vaccinations

SELECT dea.continent, dea.location, dea.date,dea.population,vac.new_vaccinations
FROM Project_portfolio.covid_deaths dea
JOIN Project_portfolio.covid_vaccinations vac
ON dea.location = vac.location
and dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 1,2,3




SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(vac.new_vaccinations) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as rolling_people_vaccinated
FROM Project_portfolio.covid_deaths dea
JOIN Project_portfolio.covid_vaccinations vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent is not null 
ORDER BY 2,3


--using CTE

WITH popvsvac 
AS (
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(vac.new_vaccinations) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as rolling_people_vaccinated
FROM Project_portfolio.covid_deaths dea
JOIN Project_portfolio.covid_vaccinations vac
  ON dea.location = vac.location
  AND dea.date = vac.date
WHERE dea.continent is not null 
)

SELECT *, (rolling_people_vaccinated/population)*100 AS percent_people_vaccinated
FROM popvsvac
