Input : Given a table TEAMS
    TEAMS
  ---------
    AUS
    ENG
    EUR
    IND
    USA

Output:Write a SQL query to print a view in such a way that
  Every team should play with every other opponent exactly once.
    MATCHES
  ----------
  AUS VS ENG
  AUS VS EUR
  AUS VS IND
  AUS VS USA
  ENG VS EUR
  ENG VS IND
  ENG VS USA
  EUR VS IND
  EUR VS USA
  IND VS USA


ANS 1:
    SELECT DISTINCT CASE
                      WHEN t1.team >= t2.team THEN t2.team
                      ELSE t1.team
                    END  || ' VS '||
                    CASE
                      WHEN t1.team >= t2.team THEN t1.team
                      ELSE t2.team
                    END Matches
    FROM teams t1
           cross join teams t2
    WHERE t1.team != t2.team
    ORDER BY Matches;


ANS 2:
  SELECT t1.team || ' VS '|| t2.team Matches
  FROM teams t1
         cross join teams t2
         WHERE t1.team < t2.team
         ORDER BY Matches;
