require_relative( "../models/pet.rb" )
require_relative( "../models/owner.rb" )
require_relative( "../models/adoption.rb" )
require("pry-byebug")

Pet.delete_all()
Owner.delete_all()
Adoption.delete_all()

pet1 = Pet.new({
    "name" => "Arya",
    "age" => 4,
    "type" => "Dog",
    "breed" => "Jack Russel",
    "admission_date" => "25/10/2014"})
pet1.save()

pet2 = Pet.new({
    "name" => "Ben",
    "age" => 6,
    "type" => "Dog",
    "breed" => "German Shephard",
    "admission_date" => "11/09/2015"})
pet2.save()

pet3 = Pet.new({
    "name" => "Cortez",
    "age" => 2,
    "type" => "Pup",
    "breed" => "Greyhound",
    "admission_date" => "12/07/2018"})
pet3.save()

owner1 = Owner.new({"name" => "Tegan"})
owner1.save

owner2 = Owner.new({"name" => "Holly"})
owner2.save

owner3 = Owner.new({"name" => "Mya"})
owner3.save

adoption1 = Adoption.new({"pet_id" => pet1.id, "owner_id" => owner1.id})
adoption1.save()

adoption2 = Adoption.new({"pet_id" => pet2.id, "owner_id" => owner2.id})
adoption2.save()

adoption3 = Adoption.new({"pet_id" => pet3.id, "owner_id" => owner3.id})
adoption3.save()

# adoption1.delete()

binding.pry
nil
