## WHAT IS THIS?

This is a project created to test how many requests a Flask API can handle. This will help the CIS team decide on what framework to use for the FCIS.


### Local Setup
*P.S.: Replace `<database user>` and `<database name>`, `<host>` and `<port>` with actual values.*


Create a file named `.env` in the root of the project and add the following:
```
APP_SETTINGS="config.DevelopmentConfig"
DATABASE_URL="postgresql://<database user>@<host>:<port>/<database name>"
```
The `.env` file has been gitignored.

### Database
Run the following commands to:


##### Create the database:

```sql
psql -f database_files/stripped_ddl/db_create.sql
```


##### Create tables:
```sql
psql -d <database name> -f database_files/stripped_ddl/create_tables.sql
```
P.S.: After running the create tables script, connect to the database and grant all privileges to the database user:
```sql
$ psql
# \c cis
# GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;
```


##### Drop tables:
```sql
psql -d <database name> -f database_files/stripped_ddl/drop_tables.sql
```


##### Drop the database:
```sql
psql -f database_files/stripped_ddl/db_drop.sql
```


##### Seeding the database with dummy test data:
```sql
psql -U <database user> <database name> < database_files/stripped_ddl/dbexport.pgsql
```


### Available Endpoints:
| Endpoints         | Methods available |
|-------------------|-------------------|
| /org_units        | GET, POST         |
| /org_units/`<pk>` | GET, PUT, DELETE  |
| /stl              | GET, POST         |


##### Running the API:
1. Start the server using `python app.py`
2. Go to `localhost:5000/<endpoint>`

##### Running the API with gunicorn:
1. Start the server using `gunicorn app:app` (Optional: -w `<number of threads>`)
2. Go to `localhost:8000/<endpoint>`
