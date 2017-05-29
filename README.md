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
* rake db:seed
Build
* rails s
* URL: /api_docs 
* Access with api_key in Table Apikey
Function
authenticate with account email: test@gmail.com and password: 12345678
*User
**Login
**Logout
**Reset Password
*Season
**Upload and import data by CSV file
*Player
**Can search number of point, wins, draws, losses maths by Player name
*Match
**Can search matches by player name or season name

========****=========

Api refer and modify:
* http://worldcup.sfg.io/  #worldcup api load data from fifa
* http://thamdinhgia.bavc.vn/api_docs #My company project product
* https://porter.io/github.com/tim-vandecasteele/grape-swagger
* http://railscasts.com/episodes/352-securing-an-api?view=asciicast #Securing an API

========****=========

Particularly proud:
* All matchs search by name of season or name of player
* And Calculate points of player gave up
Because: It make time consuming algorithm and test


