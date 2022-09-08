# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def example_sum
  execute(<<-SQL)
    SELECT
      SUM(population)
    FROM
      countries
  SQL
end

def continents
  # List all the continents - just once each.
  execute(<<-SQL)
  Select Distinct continent
  from countries;
  SQL
end

def africa_gdp
  # Give the total GDP of Africa.
  execute(<<-SQL)
  select SUM(gdp)
  from countries
  where continent = 'Africa';
  SQL
end

def area_count
  # How many countries have an area of more than 1,000,000?
  execute(<<-SQL)
  Select count(*)
  from countries
  where area > 1000000;

  SQL
end

def group_population
  # What is the total population of ('France','Germany','Spain')?
  execute(<<-SQL)
  Select sum(population)
  from countries
  where name IN ('France','Germany','Spain');

  SQL
end

def country_counts
  # For each continent show the continent and number of countries.
  execute(<<-SQL)
  Select continent, count(*)
  From countries
  Group By continent;
  SQL
end

def populous_country_counts
  # For each continent show the continent and number of countries with
  # populations of at least 10 million.
  execute(<<-SQL)
  select continent, count(*)
  from countries
  Where population > 10000000
  Group by continent;
  SQL
end

def populous_continents
  # List the continents that have a total population of at least 100 million.
  execute(<<-SQL)
  select continent
  from countries
  Where population > 100000000
  group by continent;
  SQL
end
