select * from anime;

/*1 How many anime on the list?*/
select count(anime_name) as total_anime
 from anime;
 
 /*2 Top 10 anime based on score*/
select anime_name, ranking, score
	from anime
    order by score desc
    limit 10;
    
 /*3 Top 10 anime movie based on score*/
 select anime_name, score, episodes
	from Anime
    where episodes = 1
    order by score desc
    limit 10;
    
 /*4 Top 10 anime series based on score*/
 select anime_name, score, episodes
	from anime
    where episodes != 1
    order by score desc
    limit 10;
    
 /*5 Top 10 anime based on popularity (score is not null)*/
select anime_name, popularity, score
	from anime
    where score != 0
    order by popularity desc
    limit 10;

 /*6 Top 10 anime movie based on popularity (score is not null)*/
select anime_name, popularity, score, episodes
	from anime
	where episodes = 1 and score != 0
    order by popularity desc
    limit 10;
    
 /*6 Top 10 anime series based on popularity (score is not null)*/
select anime_name, popularity, score, episodes
	from anime
	where episodes > 1 and score != 0
    order by popularity desc
    limit 10;
    
 /*7 Top 10 ongoing anime series based on score*/
select anime_name, score, episodes
	from anime
	where episodes = 0
    order by score desc
    limit 10;
    
 /*8 Top 10 anime comedy series based on score*/
 select anime_name, score, episodes, genres
	from anime
    where episodes != 1 and genres LIKE '%Comedy%'
    order by score desc
    limit 10;
    
/*9 Mention the total no of animes which started in each release dates*/
select release_date, count(release_date) as no_of_animes
from anime 
group by release_date
order by no_of_animes desc;

/*10 Find a specific anime*/
select *
from anime 
where anime_name LIKE '%Naruto%';

select *
from anime 
where anime_name LIKE '%One Piece%';


/*10 Find the anime with highest and lowest score*/
select anime_name, score as top_score
from anime
where score = (select max(score) from anime);

select anime_name, score as lowest_score
from anime
where score = (select min(score) from anime where score != 0);
    
/*11 Determine most no. of episodes for anime series*/

select episodes, count(anime_name) as no_of_animes
from anime
where episodes > 1
group by episodes
order by no_of_animes desc
limit 10;

    