# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Boat.create([
  {name: "SS Santa Maria", containers: 10, location: "Portugal"},
  {name: "SS Arizona", containers: 20, location: "New York"},
  {name: "SS Bismark", containers: 30, location: "Germany"},
  {name: "SS Essex", containers: 15, location: "England"}
  ])



Location.create([
  {name: "New York"},
  {name: "England"},
  {name: "China"},
  {name: "Spain"},
  {name: "Brazil"},
  {name: "South Africa"}
  ])

Job.create ([
  {description: "Pick up at open and deliver same day or else", origin: "New York", destination: "England", cost: "60", containers: "40", boat: "SS Santa Maria" }])


