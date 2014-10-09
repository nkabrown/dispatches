# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "nkabrown", fname: "Nathan", lname: "Brown", email: "nathan@nycda.com", password: "nathan")
User.create(username: "nyhunter77", fname: "Ken", lname: "Guie", email: "ken@nycda.com", password: "ken")
User.create(username: "wildwest", fname: "Billy", lname: "Wilder", email: "billy@nycda.com", password: "billy")
User.create(username: "wileycoyote", fname: "Brad", lname: "Holmes", email: "brad@nycda.com", password: "brad")

Post.create(title: "Great News", body: "Today I was finally able to get my apps functionality up and going. A minor triumph. Press on, press on.", user_id: 1)
Post.create(title: "1980's Nostalgia", body: "I'm really enjoying the sounds of Sunglasses Kid. '1980's Summer Breakup' is a great song that is so close to being true to life. Close, but not devestating enough. I highly recommend the 'Miss Out' remix as well.", user_id: 1)
Post.create(title: "Men I've hunted down", body: "Really the list is too long for me to remember quite correctly. Let's see; Frank Oakley, Jim Parsons, Mick O'Connor, Michael Bannon, Ed Sedgewick...that was just in that one saloon. I think that's enough to make my point.", user_id: 3)
Post.create(title: "No place like the West", body: "There is nothing like a sunset in the Western desert. Beautiful.", user_id: 3)
Post.create(title: "Best new PS4 games", body: "The Last of Us, Battlefield 4, Assassin's Creed 4, in that order.", user_id: 4)
Post.create(title: "High school is boring", body: "I hate having to go to school everyday. All I really want to do is sleep in as long as I want and then play video games. I think I'm going to be a professional video game player someday. There is such a thing as that, isn't there.", user_id: 4)