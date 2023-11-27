-- 1.  What are the names of the players whose salary is greater than 100,000?

Select player_name, salary 
From players 
Where salary >100000;

-- 2.  What is the team name of the player with player_id = 3?

Select team_name, player_name, player_id
From teams Join players
Using (team_id)
Where player_id =3;

-- 3.  What is the total number of players in each team?

Select team_id, count(player_id) As " Total_players"
From players
Group by team_id;

-- 4.  What is the team name and captain name of the team with team_id = 2?

 Select team_name, player_ID As captain_Id, player_name As captain_name  
 From players Join teams Using(team_id)
 Where player_id = (Select captain_id From teams where captain_id  =  2);
 
 -- 5.  What are the player names and their roles in the team with team_id = 1?
 
Select player_name ,team_id, role
From players
Where team_id = 1;

-- 6. What are the team names and the number of matches they have won?

Select team_name, count(winner_id) As win from teams  t join matches m on t. team_id = m.winner_id
group by winner_id;

-- 7.  What is the average salary of players in the teams with country 'USA'?

Select avg(salary) As pay from players join teams using (team_id) where country = 'USA';

-- 8.  Which team won the most matches?

Select team_name, count(winner_id) As win from teams  t join matches m on t. team_id = m.winner_id
group by winner_id order by win desc limit 1;

 Select team_name 
 From (Select winner_id, count(winner_id) As win From matches Group By winner_id Order By win Desc limit 1) As sub1 
 Join teams As t On sub1.winner_id = t.team_id;

-- 9. What are the team names and the number of players in each team whose salary is greater than 100,000?

Select team_name ,count(player_id) As Players 
From teams Join players Using( team_id)
Where salary > 100000
Group by team_id ;

-- 10. What is the date and the score of the match with match_id = 3?

Select match_id, match_date,score_team1,score_team2 from matches
where match_id =3;





















