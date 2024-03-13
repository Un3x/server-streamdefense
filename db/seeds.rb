# frozen_string_literal: true

# Admin
User.create(
  email: 'admin@random.com',
  password: 'leRandomPourLesHommes',
  role: 'ADMIN'
)

return 

# Players

reallord = User.create(
  email: 'reallordk1@random.com',
  password: 'RealLordK1',
  twitch_id: '999999999',
  nickname: 'RealLordK1',
  role: 'USER'
)

lavomancien = User.create(
  email: 'lavomancien@random.com',
  password: 'RealLordK1',
  twitch_id: '888888888',
  nickname: 'Lavomancien',
  role: 'USER'
)

orbital = User.create(
  email: 'orbital@random.com',
  password: 'Orbital',
  twitch_id: '777777777',
  nickname: 'Orbital',
  role: 'USER'
)

# Channels

unex = Channel.create(
  twitch_id: '000000000000'
)

# Ressources

wood = Resource.create(
  key: 'wood',
  name: 'Bois'
)

food = Resource.create(
  key: 'food',
  name: 'Nourriture'
)

iron = Resource.create(
  key: 'iron',
  name: 'Fer'
)

# Structures

city_hall = Structure.create(
  key: 'city-hall',
  name: 'Hotel de ville',
  description: "C'est ici que tout commence, c'est le bourg principal"
)

farm = Structure.create(
  key: 'farm',
  name: 'Ferme',
  description: "En fait, j'étais dans un paturage, j'ai tué 76 chèvres"
)

woodcamp = Structure.create(
  key: 'woodcamp',
  name: 'Camp de bucherons',
  description: "Ca coupe sec !"
)

iron_mine = Structure.create(
  key: 'iron-mine',
  name: 'Mine de fer',
  description: 'Tiens bon ta pioche, et tiens bon ta lanterne, ISSEO'
)

# Structures requirements

StructureRequirement.create(
  structure: farm,
  required_structure: city_hall,
  required_level: 1
)

StructureRequirement.create(
  structure: woodcamp,
  required_structure: city_hall,
  required_level: 1
)

StructureRequirement.create(
  structure: iron_mine,
  required_structure: city_hall,
  required_level: 1
)

# Structures Formulas

Exponential.create(
  structure: city_hall,
  category: 'duration',
  base: 2,
  multiplier: 10,
  default: 0
)

[wood, food, iron].each do |resource|
  Linear.create(
    structure: city_hall,
    category: 'storage',
    resource: resource,
    slope: 50,
    intercept: 50
  )
  Linear.create(
    structure: city_hall,
    category: 'production',
    resource: resource,
    slope: 1,
    intercept: 1
  )
  Exponential.create(
    structure: city_hall,
    category: 'cost',
    resource: resource,
    base: 2,
    multiplier: 50,
    default: 0
  )
end

Exponential.create(
  structure: farm,
  category: 'duration',
  base: 2,
  multiplier: 5,
  default: 5
)

LinearPercentage.create(
  structure: farm,
  category: 'production',
  resource: food,
  slope: 1,
  intercept: 0,
  multiplier: 0.2,
  treshold: 10
)

Linear.create(
  structure: farm,
  category: 'storage',
  resource: food,
  slope: 10,
  intercept: 0
)

Exponential.create(
  structure: farm,
  category: 'cost',
  resource: food,
  base: 2,
  multiplier: 3,
  default: 27
)

Exponential.create(
  structure: farm,
  category: 'cost',
  resource: wood,
  base: 2,
  multiplier: 8,
  default: 27
)

Exponential.create(
  structure: farm,
  category: 'cost',
  resource: iron,
  base: 2,
  multiplier: 3,
  default: 27
)

Exponential.create(
  structure: woodcamp,
  category: 'duration',
  base: 2,
  multiplier: 5,
  default: 5
)

LinearPercentage.create(
  structure: woodcamp,
  category: 'production',
  resource: wood,
  slope: 1,
  intercept: 0,
  multiplier: 0.2,
  treshold: 10
)

Linear.create(
  structure: woodcamp,
  category: 'storage',
  resource: wood,
  slope: 10,
  intercept: 0
)

Exponential.create(
  structure: woodcamp,
  category: 'cost',
  resource: food,
  base: 2,
  multiplier: 3,
  default: 27
)

Exponential.create(
  structure: woodcamp,
  category: 'cost',
  resource: wood,
  base: 2,
  multiplier: 3,
  default: 27
)

Exponential.create(
  structure: woodcamp,
  category: 'cost',
  resource: iron,
  base: 2,
  multiplier: 8,
  default: 27
)


Exponential.create(
  structure: iron_mine,
  category: 'duration',
  base: 2,
  multiplier: 5,
  default: 5
)

LinearPercentage.create(
  structure: iron_mine,
  category: 'production',
  resource: iron,
  slope: 1,
  intercept: 0,
  multiplier: 0.2,
  treshold: 10
)

Linear.create(
  structure: iron_mine,
  category: 'storage',
  resource: iron,
  slope: 10,
  intercept: 0
)

Exponential.create(
  structure: iron_mine,
  category: 'cost',
  resource: food,
  base: 2,
  multiplier: 8,
  default: 27
)

Exponential.create(
  structure: iron_mine,
  category: 'cost',
  resource: wood,
  base: 2,
  multiplier: 3,
  default: 27
)

Exponential.create(
  structure: iron_mine,
  category: 'cost',
  resource: iron,
  base: 2,
  multiplier: 3,
  default: 27
)

IdleGameFactory.new(reallord, unex).perform
IdleGameFactory.new(lavomancien, unex).perform
IdleGameFactory.new(orbital, unex).perform
