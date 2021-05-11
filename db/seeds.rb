# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w[users listings active_storage_blobs active_storage_attachments].each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table} RESTART IDENTITY CASCADE;")
end

users = [{
  first_name: "John",
  last_name: "Smith",
  mobile: "0478263934",
  address: "7 Whitechapel Road, London",
  email: "John.Smith@hotmail.com",
  password: "password" ,
  password_confirmation: "password",
},
{
  first_name: "Mary",
  last_name: "Jane",
  mobile: "0423434534",
  address: "13 Old Kent Road, London",
  email: "Mary.Jane@hotmail.com",
  password: "password" ,
  password_confirmation: "password",
},
{
  first_name: "Tom",
  last_name: "Edison",
  mobile: "0498302938",
  address: "9 Park Lane, London",
  email: "Tom.Edison@aol.com",
  password: "password" ,
  password_confirmation: "password",
},
{
  first_name: "Victor",
  last_name: "Ious",
  mobile: "0485739374",
  address: "137 Bond Street, London",
  email: "Victor.Ious@gmail.com",
  password: "password" ,
  password_confirmation: "password",
},
{
  first_name: "Tim",
  last_name: "Humphreys",
  mobile: "0484729384",
  address: "98 Oxford Street, London",
  email: "Tim.Humphreys@live.com",
  password: "password" ,
  password_confirmation: "password",
}]
  
users.each { |user| User.create!(user) }

choc_details = {
  "Sweet Chocolate" => "The sweetest chocolate money can buy (:",
  "White Chocolate" => "Just milk and sugar lying about being chocolate.",
  "Dark Chocolate" => "Lighten up, dude!",
  "Gourmet Chocolate" => "The good stuff!",
  "Fine Chocolate" => "Only the finest!",
  "Assorted Chocolates" =>  "An endless selection :D",
  "Strong Chocolate" => "This one's been hitting the gym.",
  "Coffee Chocolate" => "When you need that extra hit!",
  "Sour Chocolate" => "Something for the adventurous!",
  "Gummy Bear" => "How did this get in here?",
  "Party Chocolate" => "Your friends will love you - even more!",
  "Chocolate Factory" => "Comes with a family of Oompa Loompas."
}

choc_details.each_with_index do |(choc_name, choc_desc), index|
  choc = {name: choc_name, description: choc_desc, price: rand(1..1000000).to_s, age: rand(1..500).to_s, rating: rand(1..100).to_s, user_id: rand(1..users.size)}
  listing = Listing.create!(choc)
  listing.image.attach(io: File.open(Rails.root / 'docs' / 'choc_seeds' / "choc_#{index + 1}.jpeg"), filename:"choc_#{index + 1}.jpeg")
end