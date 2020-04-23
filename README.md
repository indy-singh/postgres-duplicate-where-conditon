# postgres-duplicate-where-conditon

This is repo to help replicate a weird pg problem that is described [here](https://www.postgresql.org/message-id/flat/CAOtbvRKSSg5VOY1tE7h4tM09J%3DetjNWyM8cMm%3DG-cRk7%3DKyeEw%40mail.gmail.com)

This happens on 9.5.19, 9.6.3, 12.2 (I've only explicity tested those versions).

Data and SQL statements are include in the repo to help reproduce the issues.

Assuming that the tables are created and the data has been imported.

Run this statement:-
```sql
UPDATE problem_instance
SET message = md5(random()::text)
```
And then this statement:-
```sql
UPDATE problem_instance
SET message = message || md5(random()::text)
```

Observe the difference between these two queries:-

Query A:
```sql
UPDATE problem_instance SET processed = false
FROM problem
WHERE problem.id = problem_instance.problem_id
AND problem.status != 2
AND processed = true;
```

Query B:
```sql
UPDATE problem_instance SET processed = false
FROM problem
WHERE problem.id = problem_instance.problem_id
AND problem.status != 2
AND problem.status != 2
AND processed = true;
```
