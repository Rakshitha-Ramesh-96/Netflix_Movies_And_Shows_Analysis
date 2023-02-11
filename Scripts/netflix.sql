-- creating the netflix database
create database netflix;

-- use the database
use netflix;

-- create the table
create table titles(
id text ,
title text ,
type text ,
description text ,
release_year year ,
age_certification text ,
runtime int ,
genres text ,
production_countries text ,
seasons int ,
imdb_id text ,
imdb_score float ,
imdb_votes bigint ,
tmdb_popularity float ,
tmdb_score float);

-- Import the csv file through the workbench

-- query_1 : query the data from the table titles
select * from titles
LIMIT 6000;

-- query_2 : distinct type 
select distinct type 
from titles
LIMIT 6000;

-- query_3 : count of shows and movies
select 
COUNT(title) AS Total_title_count,
COUNT(CASE WHEN type='SHOW' THEN id ELSE NULL END) AS show_count,
COUNT(CASE WHEN type='MOVIE' THEN id ELSE NULL END) AS movie_count
from titles;

-- query_4 : count of title release year
select release_year,
       COUNT(title) AS Total_title_count
from titles
group by release_year;

-- query_5 :count of movie and shows by the release year
select 
release_year,
COUNT(CASE WHEN type='SHOW' THEN id ELSE NULL END) AS show_count,
COUNT(CASE WHEN type='MOVIE' THEN id ELSE NULL END) AS movie_count
from titles
group by release_year;

-- query_6 : grouping the title by genres
select distinct genres,
       COUNT(title) AS Total_count
from titles
group by genres
order by 2 DESC
LIMIT 2000;

-- query_7 : grouping the title by genres and type 
select genres,
       COUNT(case when type='SHOW' then title else null end) AS no_of_shows,
       COUNT(case when type='MOVIE' then title else null end) AS no_of_movies,
       COUNT(title) AS Total_count
from titles
group by genres
order by 3 DESC;

-- query_8 : grouping the title by imdb_score
select imdb_score,
       COUNT(title) As Total_title_count
from titles
WHERE imdb_score > 0
group by imdb_score
order by imdb_score DESC;

-- query_9 : grouping the title by imdb_score and type
select imdb_score,
       COUNT(case when type='SHOW' then title else null end) AS no_of_shows,
       COUNT(case when type='MOVIE' then title else null end) AS no_of_movies,
       COUNT(title) AS Total_title_count
from titles
WHERE imdb_score > 0
group by imdb_score
order by imdb_score DESC;

-- query_10 : grouping geners by average imdb_score
select genres,
       AVG(imdb_score) AS Average_imdb_score
from titles
group by genres
order by 2 DESC
LIMIT 2000;

-- query_11 : grouping geners by average imdb_votes
select genres,
       AVG(imdb_votes) AS Average_imdb_votes
from titles
group by genres
order by 2 DESC
LIMIT 2000;

-- query_12 : grouping the titles by the age_certification
select age_certification AS Age_certification,
       COUNT(title) AS Total_title_count
from titles
group by 1
order by 2;

-- query_13 : grouping titles by age_certification and Average imdb_score
select age_certification AS Age_certification,
       AVG(imdb_score) AS Average_imdb_score
from titles
group by 1
order by 1 DESC;

-- query_14 : grouping the title by tmdb_score
select tmdb_score,
       COUNT(title) As Total_title_count
from titles
WHERE tmdb_score > 0
group by tmdb_score
order by tmdb_score DESC;

-- query_15 : grouping the title by tmdb_score and type
select tmdb_score,
       COUNT(case when type='SHOW' then title else null end) AS no_of_shows,
       COUNT(case when type='MOVIE' then title else null end) AS no_of_movies,
       COUNT(title) AS Total_title_count
from titles
WHERE tmdb_score > 0
group by tmdb_score
order by tmdb_score DESC;

-- query_16 : grouping geners by average tmdb_score
select genres,
       AVG(tmdb_score) AS Average_tmdb_score
from titles
group by genres
order by 2 DESC
LIMIT 2000;

-- query_17 : grouping titles by age_certification and Average tmdb_score
select age_certification AS Age_certification,
       AVG(tmdb_score) AS Average_tmdb_score
from titles
group by 1
order by 1 DESC;

-- query_18 : grouping geners by comparing the average imdb_score and tmdb_score 
select genres,
       AVG(imdb_score) AS Average_imdb_score,
       AVG(tmdb_score) AS Average_tmdb_score
from titles
group by genres
LIMIT 2000;