# Datonator

To start your initial configurations:

Remember that you assumes to use mysql database

Create a `.env` file in root, with something like this:

```
export MYSQL_USER=root
export MYSQL_PASSWORD=abc123
export MYSQL_DATABASE=datonator_db

```

Than open your terminal `source .env`


  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  
## Database seeds
 
Now you can enter in your console with `iex -S mix` 

Then run an experimental seed, as times as you want, pass this command above: 

`Datonator.create_eligibles`

## Running up your webserver

So now you can run the webserver

`mix phx.server`

Visit your localhost into http://localhost:4000/api/report/eligibles

And voalá!