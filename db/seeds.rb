# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Genre.destroy_all
Artist.destroy_all
Movie.destroy_all

@user1 = User.create(first_name: "John", last_name: "Smith", email: "johnsmith@gmail.com", password: "john", password_confirmation: "john")
@user2 = User.create(first_name: "Adam", last_name: "Jones", email: "adamjones@gmail.com", password: "adam", password_confirmation: "adam")

@tom_cruize = Artist.create(name: "Tom Cruize", gender: "male", age: 57)
@tom_hanks = Artist.create(name: "Tom Hanks", gender: "male", age: 63)
@ben_stiller = Artist.create(name: "Ben Stiller", gender: "male", age: 54)
@patrick_wilson = Artist.create(name: "Patrick Wilson", gender: "male", age: 46)
@scarlett_johansson = Artist.create(name: "Scarlett Johansson", gender: "female", age: 35)
@sam_worthington = Artist.create(name: "Sam Worthington", gender: "male", age: 43)
@dwayne_johnson = Artist.create(name: "Dwayne Johnson", gender: "male", age: 47)

@action = Genre.create(name: "action")
@drama = Genre.create(name: "drama")
@comedy = Genre.create(name: "comedy")
@horror = Genre.create(name: "horror")
@sci_fi = Genre.create(name: "sci-fi")
@adventure = Genre.create(name: "adventure")

@mission_impossible = Movie.create(title: "Mission Impossible", budget: 8000000, duration: "1h 50m", user: @user1, genre: @action, artist: @tom_cruize)
@the_terminal = Movie.create(title: "The Terminal", budget: 6000000, duration: "2h 8m", user: @user2, genre: @drama, artist: @tom_cruize)
@zoolander = Movie.create(title: "Zoolander", budget: 28000000, duration: "1h 45m", user: @user1, genre: @comedy, artist: @ben_stiller)
@meet_the_parents = Movie.create(title: "Meet the parents", budget: 55000000, duration: "1h 48m", user: @user2, genre: @comedy, artist: @ben_stiller)
@conjuring = Movie.create(title: "The Conjuring", budget: 2000000, duration: "1h 52m", user: @user1, genre: @horror, artist: @patrick_wilson)
@lucy = Movie.create(title: "Lucy", budget: 4000000, duration: "1h 30m", user: @user2, genre: @sci_fi, artist: @scarlett_johansson)
@avatar = Movie.create(title: "Avatar", budget: 237000000, duration: "2h 43m", user: @user1, genre: @sci_fi, artist: @sam_worthington)
@jumanji = Movie.create(title: "Jumanji", budget: 65000000, duration: "1h 59m", user: @user2, genre: @adventure, artist: @dwayne_johnson)
