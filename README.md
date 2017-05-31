Info API

  *Ruby 2.2.0
  
  *Rails 4.2.0
  
  *Database use Mysql
  
  *Grape-swagger
  
Install
* Install ruby 2.2.0
* Bundle install
* Change database.yml set user password of mysql
* rake db:setup

Build
* rails s
* URL: http:/localhost:3000/api_docs # If test with browser Grape-swagger tool
* Access with api_key in Table Apikey

Function

authenticate with account:
* email: test@gmail.com
* password: 12345678

Parameter
* Header: Apikey
* authenticate require: UserToken
* Field at search: search_text

User
* Login  # POST http:/localhost:3000/api/v1/users/login
* Logout  # POST http:/localhost:3000/api/v1/users/logout
* Reset Password # GET http:/localhost:3000/api/v1/users/forgot-password
* Parameter: email, password

Season
* Upload and import data by CSV file # POST http:/localhost:3000/api/v1/seasons/csv
* Parameter: csv[][file]

Player
* Can search number of point, wins, draws, losses maths by Player name # GET http:/localhost:3000/api/v1/players/search
* Parameter: search_text

Match
* Can search matches by player name or season name # GET http:/localhost:3000/api/v1/matches/search_matches
* Parameter: search_text
========****=========

Api refer and modify:
* http://worldcup.sfg.io/  #worldcup api load data from fifa
* http://thamdinhgia.bavc.vn/api_docs #My company project product
* https://porter.io/github.com/tim-vandecasteele/grape-swagger
* http://railscasts.com/episodes/352-securing-an-api?view=asciicast #Securing an API

========****=========

Particularly proud:
* Import and insert data with csv
* And Calculate points of player gave up
Because: It make time consuming algorithm and test


