# Postgres Full re-installation on Mac

## Installation and psql connect

1. Let's look at your postgres version 
2. (`brew list | grep postgres` will show you the name of the formula. (e.g. `postgresql@15`)
3. If that version isn't 17 (or if your services are an issue) then let's change it: so do `brew uninstall <whatever that name was>` then `brew install postgresql@17`.
4. It turns out you now need to manually add postgres directories to the path, so do:
```sh
echo 'export PATH="/usr/local/opt/postgresql@17/bin:$PATH"' >> ~/.zshrc
export LDFLAGS="-L/usr/local/opt/postgresql@17/lib"
export CPPFLAGS="-I/usr/local/opt/postgresql@17/include"
```
then let's reload your terminals with that new information: `source ~/.zshrc`. (If you can't paste the 3 lines above as a block, do it one line at a time)
5. (`initdb`, which creates a first database, is run automatically by when you use brew services and a database called `postgres` is created)
6. You'll need to create a superuser called `postgres` and you do that like this: `createuser --superuser postgres`.
7. OK, let's connect to postgres with psql: `psql -h localhost -p 5432 -d postgres -U postgres` (default user password is `postgres` but you don't get asked for it)

---
## IF there's a password issue:
Follow this: <https://www.youtube.com/watch?v=CHYjDuaYA4M&ab_channel=DatabaseStar> tutorial

---

## PGAdmin setup

1. You should add pgadmin via homebrew (`brew install pgadmin4`)
2. Right-click on 'servers' (in the sidebar) and select 'register' and then 'server'
3. In the first ('General') tab, give it a name (will be highlighted as a red box), like 'local'
4. In the second ('Connection') tab, add 'localhost' as the Host name (in the first input)
5. In the third ('Parameters') tab, add (with the `+` symbol, just above the list) a parameter called 'Options' and set its value to `-csearch_path=public`. (this is a shortcut to stop you having to query `public.<something>` every time you query)
5. You can create this without a password (or you can supply `postgres`, which is the default password)
6. The connection should go in the sidebar and you should be good to go, which you can test by selecting `local>databases>postgres` (actually click on the name of the database) and then if you look above there should be a 'database with a play button' symbol, as the first button to the right of 'Object explorer' in the top left corner.
In there type `SELECT * FROM pg_user;` and then hit the play button above.

---


postgresql://
neondb_owner (user)
:
H9nkqbgpCw3U (pw)
@
ep-summer-math-a2wggk1z.eu-central-1.aws.neon.tech (host)
:5432 (port)
/
neondb (db name)

?sslmode=require

```SQL
CREATE DATABASE cars;
```