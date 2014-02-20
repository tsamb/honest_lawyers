# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Type.create(name:"research")
Type.create(name:"writing")
Type.create(name:"court appearance")
Type.create(name:"travel")
Type.create(name:"telephone call")
Type.create(name:"email correspondence")

User.create(name: "Harvey Birdman", email: "harvey@sebben.com", password: "password", password_confirmation: "password")
User.create(name: "Lois Lane", email: "lois@dailyplanet.com", password: "password", password_confirmation: "password")

Client.create(name: "LexCorp", number: "555123")
Client.create(name: "Scooby Snacks Inc", number: "777456")
Client.create(name: "Sealab Industries", number: "777123")

m1 = Matter.create(description: "Advise on personal injury suit with Superman" , number: "111222" , user_id: 1, client_id: 1, open: true)
m1.tasks.create(type_id: 1, description: "initial legal research on tort law", start_time: 1389342950, end_time: 1389346550 )
m1.tasks.create(type_id: 1, description: "further research into damage by superheroes", start_time: 1389430800, end_time: 1389432600 )
m1.tasks.create(type_id: 5, description: "call to Lex", start_time: 1389446640, end_time: 1389448080 )
m1.tasks.create(type_id: 2, description: "drafting submissions for court", start_time: 1389609660, end_time: 1389620460 )

m2 = Matter.create(description: "Sue ghosts for mental shock tort" , number: "222444" , user_id: 1, client_id: 2, open: true)

m3 = Matter.create(description: "Lex Luthor's biography", number: "555000" , user_id: 2, client_id: 1, open: true)
m4 = Matter.create(description: "Investigative piece on spooky places", number: "666999", user_id: 2, client_id: 2, open: true)

m5 = Matter.create(description: "Advertorial for underwater tourism", number: "888000" , user_id: 2, client_id: 3, open: true)
m5.tasks.create(type_id: 1, description: "read up about deep sea creature", start_time: 1392122100, end_time: 1392125700)
m5.tasks.create(type_id: 5, description: "interview Captain Murphy about deep sea life", start_time: 1392215700, end_time: 1392217140)
