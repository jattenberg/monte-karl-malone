# MDS in a box
This project serves as end to end example of running the "Modern Data Stack" in a local environment. Development is primarily done on Windows via WSL, which means Mac is untested (but should work).

## Current progress
Right now, you can get the nba schedule and elo ratings from this project and generate the following query. more to come, see to-dos at bottom of readme. And of course, the dbt docs are self hosted in Github Pages, [check them out here](https://matsonj.github.io/nba-monte-carlo/).
![image](https://user-images.githubusercontent.com/16811433/195012880-adf8da03-ab16-4c16-8080-95514fb41c21.png)
![image](https://user-images.githubusercontent.com/16811433/195012951-dde884a0-88f5-48d5-8203-b6f06ba7dbd4.png)

## Getting started - OS-X
1. build your project & run your pipeline
```
make build
make run
```
2. Connect duckdb to superset. first, create an admin users
```
meltano invoke superset:create-admin
```
 - then boot up superset
```
meltano run superset:ui
```
 - lastly, connect it to duck db. navigate to localhost:8088, login, and add duckdb as a database.

   - SQL Alchemy URL: ```duckdb:////tmp/mdsbox.db```

   - Advanced Settings > Other > Engine Parameters: ```{"connect_args":{"read_only":true}}```

3. Explore your data inside superset. Go to SQL Labs > SQL Editor and write a custom query. A good example is ```SELECT * FROM reg_season_end```.

## Running your pipeline on demand
After your run ```make run```, you can run your pipeline again at any time with the following meltano command:
```
meltano run tap-spreadsheets-anywhere target-duckdb dbt-duckdb:build
```

## Todos
- [x] write initial steps
- [x] create a makefile so you 'make pipeline' and it just all happens
- [x] get data and load to github storage
- [x] add extraction steps to spreadsheets anywhere
- [x] build basic data frame w/dbt
- [x] build the monte carlo sim
- [x] add meta-stats
  - [x] playoff seeding
  - [x] playin game stuff
  - [x] playoff schedule
  - [x] series winners
  - [x] playoff wins
- [ ] some basic charts in superset (replicate 538?)
- [x] add github action to build it
- [x] add dbt docs as github pages

## Optional stuff
- [ ] add dbt tests
- [ ] add model descriptions
- [ ] change elo calculation to a udf
- [ ] make playoff elimination stuff a macro (param: schedule type)
