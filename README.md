![Mission elixir](https://i.imgur.com/XUtdr1o.png)
<h2 align="center"> Next Level Week:  Mission Elixir </h2>
<p align="center">
	<img src="https://img.shields.io/badge/Elixir-503C54?style=for-the-badge&logo=elixir&logoColor=white">
	<img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" />
	<a href="https://github.com/Mimemat/nlw-together-elixir">
	<img src="https://img.shields.io/github/stars/Mimemat/nlw-together-elixir?style=for-the-badge" 	/>
	</a>
</p>

A project made during Rocketseat's Next Level Week Together

### Technologies 🖥️
- Elixir
- Phoenix
- Docker
- Postgres
- Absinthe

### Extra improvements
- JWT Authentication
- Password hashing

### How to run
#### Requirements
- Elixir
- Docker
- Erlang
- Git
####  Running
```bash
# Clone the repository
$ git clone https://github.com/Mimemat/nlw-together-elixir wabanex

# Go to its directory
$ cd wabanex/

# Install dependencies
$ mix deps.get

# Run database using docker
$ docker compose up -d 

# Setup database
$ mix ecto.setup

# Run server
$ mix phx.server

# Server will run on port 4000
 ``` 