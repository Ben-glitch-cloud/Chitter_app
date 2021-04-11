<h1 align="center">Chitter App</h1> 

<p align="center"><img width="300" src="https://user-images.githubusercontent.com/71974361/112901568-d6730880-90dc-11eb-8ed6-2b33c36fb3b3.gif"></p>

<p align="center"> This repo follows the re-creation of the MAKERS Chitter app challenge from week 4. </p>  
</br> 
</br> 
<h2 align="center">Images of the Project</h2>

<p align="center"><img width="500" src="https://user-images.githubusercontent.com/71974361/114308951-6782b000-9add-11eb-846b-58a99583bb4d.png" /></p>

<h2 align="center">What this app uses</h2>  

<h3 align="center">Languages</h3>

<p align="center"><img src="https://img.shields.io/badge/-Ruby-black?logo=Ruby&logoColor=red"> <img src="https://img.shields.io/badge/-HTML5-black?logo=HTML5&logoColor=orange"> <img src="https://img.shields.io/badge/-CSS3-black?logo=CSS3&logoColor=blue"></p> 

<h3 align="center">Ruby Gems</h3>  

<p align="center"><img src="https://img.shields.io/badge/-Rspec-black?logo=RubyGems&logoColor=red"> <img src="https://img.shields.io/badge/-Capybara-black?logo=RubyGems&logoColor=orange"> <img src="https://img.shields.io/badge/-Sintra-black?logo=RubyGems&logoColor=gold"> <img src="https://img.shields.io/badge/-Sintra/flash-black?logo=RubyGems&logoColor=green"></p>

<h3 align="center">Database</h3> 

<p align="center"><img src="https://img.shields.io/badge/-postgreSQL-black?logo=PostgreSQL&logoColor=lightgrey"></p>

<h2 align="center">User story</h2> 

<h4>Key</h4>   

| Task info | Symbol | 
| :---: | :---: |
| Task Done |  ✅  |
| Task in progress | 🟡  |
| Task not done | 🛑 |

``` 
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
``` 
✅

``` 
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
``` 
✅

``` 
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
``` 
✅ 
 
``` 
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
``` 
✅ 

``` 
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
``` 
✅

``` 
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
``` 
✅ 

<h3>Things that have been added</h3> 

``` 
As a Maker 
So I can delete peeps
I would like to be able to delete posts
```
✅ 

``` 
As a Maker 
So I can comment on a peep
I would like to comment on other peoples peeps 
```
✅ 

``` 
As a Maker 
So I can like a peep 
I would like to be able to like a peep 
``` 
🟡

<h2 align="center">How to get started</h2> 

1. Fork the repo to your github account.  

2. Clone the project in to a coding software e.g. Visual Studio or Atom 
``` 
$ clone repo name 
```
3. Run Bundle install to install all the ruby gems. 
```
$ bundle install 
``` 

4.Create the datebase and tables for the project from the folder db.  

To open postgreSQL 
``` 
$ psqlpostgres  
```  
If you are not sure what the commands are for postgreSQL then follow the link <a href="https://gist.github.com/Kartones/dd3ff5ec5ea238d4c546">Commands</a> 

5. Start running Ruby version 2.5.0. 
``` 
$ rvm 2.5.0
``` 
If you dont have Ruby version 2.5.0, then run this command to install.  
``` 
$ rbenv install 2.5.0 
$ brew update && brew upgrade ruby-build 
```
To check Ruby has been installed run. 
```
$ list rvm 
``` 

6. To run the app.  
```
$ rackup
``` 
👏 All Done ✅

