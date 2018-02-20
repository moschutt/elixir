# My notes from the class.

## Getting going

See the Dockerfile for requirements and use this for developing new apps.

### Post run

The following need to be done after starting the Docker image.

1. Log in as root and run `service postgresql start` to start postgres.
2. Enter `echo "postgres:postgres" | chpasswd` to change the password for user postgres.
3. Change to user postgres (`su - postgres`) and start the postgres console (`psql`).  Then run `ALTER USER postgres WITH PASSWORD 'postgres'` to change the db password.  Change to whatever you specify in the _config/dev.exs_ file (default is postgres/postgres)
4. Log out as root and log in as the developer user id, i.e. _mark_.
5. run npm install - maybe, it will complain when you try to run using `iex -S mix phoenix.server`, just do what it sais.

## Starting server from iex

`iex -S mix phoenix.server`

## Migrations

1. Run `mix ecto.gen.migration add_topics`.  This will create a new migration file in the priv/repo/migrations folder.  These are time-stamped to keep migrations in order.
2. Edit the migration file.  i.e. (20180219183624_add_topics.exs). adding in the table definition stuff.
3. run `mix ecto.migrate` to execute the migration and create/update the tables.

## Interesting programming stuff

SEe the [Materialize](http://materializecss.com/getting-started.html) CSS framework, more modern than Bootstrap, which is the default.

## Design Problem / Solution

| Problem | Solution |
| ---- | ---- |
| Need a new URL. | Add a new route in our router file |
| New routes must map to a function in a controller | Add a new function in a controller to handle the request |
| Need to show a form to the user | Make a new template that contains the form |
| Need to translate data in the form to something that can be saved in the DB | Create a 'Topic' model that can translate raw data from the form to something that can be saved |

## Helpful tools

`mix phoenix.routes` returns available paths within the application.

ex:

> $ mix phoenix.routes
ex:                                                                                      page_path  GET   /            Discuss.PageController :index
 topic_path  GET   /topics/new  Discuss.TopicController :new
 topic_path  POST  /topics      Discuss.TopicController :create


