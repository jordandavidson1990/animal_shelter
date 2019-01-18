require_relative( "../models/pet.rb" )
require_relative( "../models/owner.rb" )
require_relative( "../models/adoption.rb" )


Pet.delete_all()
Owner.delete_all()
Adoption.delete_all()

pet1 = Pet.new({
    "name" => "Arya",
    "age" => 4,
    "type" => "Dog",
    "breed" => "Jack Russel",
    "admission_date" => "2015",
    "status" => "Still in Training"})
pet1.save()

pet2 = Pet.new({
    "name" => "Ben",
    "age" => 6,
    "type" => "Dog",
    "breed" => "German Shephard",
    "admission_date" => "2014",
    "status" => "Looking for a New Home"})
pet2.save()

pet3 = Pet.new({
    "name" => "Cortez",
    "age" => 2,
    "type" => "Pup",
    "breed" => "Greyhound",
    "admission_date" => "2018",
    "status" => "Looking for a New Home"})
pet3.save()

pet4 = Pet.new({
    "name" => "Bailey",
    "age" => 8,
    "type" => "Dog",
    "breed" => "Border Collie",
    "admission_date" => "2012",
    "status" => "Looking for a New Home"})
pet4.save()

pet5 = Pet.new({
    "name" => "Miguel",
    "age" => 3,
    "type" => "Cat",
    "breed" => "Persian",
    "admission_date" => "2016",
    "status" => "Still in Training"})
pet5.save()

pet6 = Pet.new({
    "name" => "Jack",
    "age" => 12,
    "type" => "Snake",
    "breed" => "Rattle",
    "admission_date" => "2012",
    "status" => "Looking for a New Home"})
pet6.save()

pet7 = Pet.new({
    "name" => "Buttercup",
    "age" => 12,
    "type" => "Cat",
    "breed" => "British Shorthair",
    "admission_date" => "2006",
    "status" => "Still in Training"})
pet7.save()

pet8 = Pet.new({
    "name" => "Dom",
    "age" => 2,
    "type" => "Cat",
    "breed" => "Persian",
    "admission_date" => "2015",
    "status" => "Still in Training"})
pet8.save()

owner1 = Owner.new({"name" => "Tegan"})
owner1.save

owner2 = Owner.new({"name" => "Holly"})
owner2.save

owner3 = Owner.new({"name" => "Mya"})
owner3.save

owner4 = Owner.new({"name" => "Inigo"})
owner4.save

owner5 = Owner.new({"name" => "Westley"})
owner5.save

owner6 = Owner.new({"name" => "Vizzini"})
owner6.save

adoption1 = Adoption.new({"pet_id" => pet1.id, "owner_id" => owner1.id, "year_adopted" => "2018"})
adoption1.save()

adoption2 = Adoption.new({"pet_id" => pet2.id, "owner_id" => owner2.id, "year_adopted" => "2018"})
adoption2.save()

adoption3 = Adoption.new({"pet_id" => pet3.id, "owner_id" => owner3.id, "year_adopted" => "2018"})
adoption3.save()

# adoption1.delete()

nil
