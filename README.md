# 🎁 What2Gift

A gift suggestion web app that recommends personalised gifts by **age, hobbies & interests, occasion and budget**.

Built with **HTML, CSS, PHP and MySQL**. No frameworks, no build step.

## Features

- **165 curated gifts** across 22 interest categories (tech, gaming, cooking, outdoors, beauty, pets, toys and more)
- **12 occasions**: birthdays, anniversaries, weddings, graduation, new baby, Mother's/Father's Day and more
- **Smart matching:** gifts are filtered in MySQL by age range, occasion and budget. They're ranked by how many of the selected interests they match, and a gift that hits all of them gets a *Perfect match* badge.
- Every search is a GET request, so you can share the link to a set of results
- Responsive design that works on phones
- Prepared statements and whitelisted inputs protect against SQL injection, and all output is escaped

## Run locally (XAMPP)

1. Copy this folder to `C:\xampp\htdocs\what2gift`.
2. Start **Apache** and **MySQL** in the XAMPP Control Panel.
3. Open http://localhost/phpmyadmin, create a database named `what2gift`, then **Import** `schema.sql`.
4. Visit http://localhost/what2gift

## Deploy

The database connection is configured with environment variables. The defaults match XAMPP.

| Variable  | Default     |
|-----------|-------------|
| `DB_HOST` | `127.0.0.1` |
| `DB_PORT` | `3306`      |
| `DB_NAME` | `what2gift` |
| `DB_USER` | `root`      |
| `DB_PASS` | *(empty)*   |

- **Shared PHP hosting** (InfinityFree, Hostinger, cPanel): upload the files, create a MySQL database, import `schema.sql`, then edit the defaults in `db.php`.
- **Docker** (Render, Railway, Fly.io): the included `Dockerfile` runs the app on Apache. Set the `DB_*` variables to point at a managed MySQL database.

```bash
docker build -t what2gift .
docker run -p 8080:80 -e DB_HOST=host.docker.internal what2gift
```

## Project structure

```
index.php   – finder form, filtering query and results
db.php      – PDO MySQL connection
schema.sql  – table definition and gift data
style.css   – styles
Dockerfile  – container deployment
```
