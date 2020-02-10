# bookmark_solo
A web app that allows users to store bookmarks, using a database.

## Instructions

Clone the repo:
```sh
git clone https://github.com/CharlyMannion/bookmark_solo
```

Ruby Version:
```sh
2.5.0
```

Run:
```sh
bundle install
```

To see the app in your web browser:
```sh
rackup
```

Then go to:
```sh
http://localhost:9292/
```

## Connecting to the Database
* Use Homebrew to install the package

We can use the package manager Homebrew to start the install of PostgreSQL:

```sh
$ brew install postgresql
```

After Homebrew has downloaded PostgreSQL it will show you some installation instructions: follow them!

* Allow Homebrew to start and stop the Postgres service

PostgreSQL is a database management service. It's handy to keep PostgreSQL running 'in the background'. This command will start PostgreSQL in the background and restart it when you login:

```shell
$ brew services start postgresql
```

* Interact with the PostgreSQL database management system

PostgreSQL provides a built-in interface, called `psql`. It's a command-line tool that allows you to interact with databases. You can think of it like IRB: it's a REPL. Where IRB gives you a Ruby interface, `psql`'s interface uses a different language: 'Structured Query Language', or **SQL**.

> `psql` also adds a couple of commands on top of SQL, for interacting with the database system.

PostgreSQL also provides one built-in database, called `postgres`.

To start `psql`, type `psql <database name>` into a Terminal, where `<database name>` is the name of the database you want to interact with. So, typing `psql postgres` will give us direct access to that first database:

```
$ psql postgres
postgres=#
```

NOTE: You may need to create a database to use psql
```sh
createdb "your_user_name_here"
```

* Create a database using SQL

Now that we're in the `psql` REPL environment, let's create the Bookmark Manager database using SQL:

```
postgres=# CREATE DATABASE "bookmark_manager";
```

> The semicolon is important! SQL is an old language. You've got to end lines with semicolons.


## User Stories
```
As a user,
So I can have access to my favourite web pages
I want to see a list of my bookmarks.

As a user,
So I can go back to a page later
I want to save it in my bookmarks.

As a user,
So I can remove the pages I no longer need,
I want to delete bookmarks from the list.

As a user,
So I can amend changed bookmarks,
I want to modify an existing bookmark.

As a user,
So I can remember what a page is about,
I want to add a comment to a bookmark.

As a user,
So I can organise my bookmarks,
I want to add category tags to my bookmarks.

As a user,
So I can see similar bookmarks together,
I want to filter my bookmarks by tag.
```

## Domain Model
![Bookmark Manager domain model](./images/bookmark_manager_1.png)

## Model View Controller Diagram
```

| Component   | Responsibility                                | Refactor                                |
|------------ |---------------------------------------------  |---------------------------------------- |
| Model       | Encapsulate logic with relevant data          | Encapsulate bookmark data in a class    |
| View        | Display the result to a user                  | Show the bookmark data in a list        |
| Controller  | Get data from the model and put in the view   | Render bookmark data into to the view   |
```
