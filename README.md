# Music library database app
<div align="left">
  <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/EvSivtsova/bank_tech_test">
</div>
<div>
  <img src="https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white"/> 
  <img src="https://img.shields.io/badge/Sinatra-black?style=for-the-badge&logo=Sinatra&logoColor=white" alt="Sinatra"/>
  <img src="https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white"/>
  <img src="https://img.shields.io/badge/RSpec-blue?style=for-the-badge&logo=Rspec&logoColor=white" alt="Rspec"/>
  <img src="https://img.shields.io/badge/Test_coverage:_100-blue?style=for-the-badge&logo=Rspec&logoColor=white" alt="Rspec"/>
</div><br>

This is a Makers' exercise from week 4 **Web applications**. In this module I learned to:
* Explain how HTTP requests and responses work at a high level
* Write integration tests for a web application
* Implement web routes using a lightweight web framework (Sinatra)
* Follow a debugging process for a web application

## TechBit

Technologies used: 
* Ruby(3.0.0)
* RVM
* Sinatra(2.2)
* Rspec(Testing)
* Rack-test (2.0)
* Simplecov(Test Coverage)

Clone the repository and run `bundle install` to install the dependencies within the folder:

```
git clone https://github.com/EvSivtsova/music-library-database-app.git
cd music-library-database-app
bundle install
```

To run the tests:

```
createdb music_library_test
rspec
```

To run the app and see individudal routes:

```
createdb music_library
psql -h 127.0.0.1 music_library < spec/seeds/music_library.sql
rackup
```
Go to `http://localhost:9292/:route` to explore the routes.

<img src='https://github.com/EvSivtsova/music-library-database-app/blob/main/outputs/artists-route.png' width=300px>
<img src='https://github.com/EvSivtsova/music-library-database-app/blob/main/outputs/new-album-route.png' width=300px>

View more outputs [here](https://github.com/EvSivtsova/music-library-database-app/tree/main/outputs).


<img src='https://github.com/EvSivtsova/music-library-database-app/blob/main/outputs/music-library-database-test-coverage.png'>
