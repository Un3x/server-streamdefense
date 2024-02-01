# frozen_string_literal: true

# Admin
User.create(
  email: 'admin@random.com',
  password: 'leRandomPourLesHommes',
  role: 'ADMIN'
)

# Structures

hotel_de_ville = Structure.create(
  name: 'Hotel de ville',
  description: 'Ceci est un hotel de ville'
)

ferme = Structure.create(
  name: 'Ferme',
  description: 'Ceci est une ferme'
)

scierie = Structure.create(
  name: 'Scierie',
  description: 'Ceci est un scierie'
)

camp_militaire = Structure.create(
  name: 'Camp militaire',
  description: 'Ceci est un camp militaire'
)

# Structures requirements

StructureRequirement.create(
  structure: camp_militaire,
  required_structure: scierie,
  required_level: 2
)

StructureRequirement.create(
  structure: camp_militaire,
  required_structure: ferme,
  required_level: 2
)

# Ressources

bois = Resource.create(
  name: 'Bois'
)

nourriture = Resource.create(
  name: 'Nourriture'
)

fer = Resource.create(
  name: 'Fer'
)

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

# Games

game_1 = IdleGame.create(
  channel: unex,
  user: reallord
)

game_2 = IdleGame.create(
  channel: unex,
  user: lavomancien
)

game_3 = IdleGame.create(
  channel: unex,
  user: orbital
)

# Games Ressources

IdleGameResource.create(
  idle_game: game_1,
  resource: bois,
  quantity: 100
)

IdleGameResource.create(
  idle_game: game_1,
  resource: nourriture,
  quantity: 1000
)

IdleGameResource.create(
  idle_game: game_1,
  resource: fer,
  quantity: 2000
)

IdleGameResource.create(
  idle_game: game_2,
  resource: bois,
  quantity: 3000
)

IdleGameResource.create(
  idle_game: game_2,
  resource: nourriture,
  quantity: 69
)

IdleGameResource.create(
  idle_game: game_2,
  resource: fer,
  quantity: 70
)

IdleGameResource.create(
  idle_game: game_3,
  resource: bois,
  quantity: 0
)

IdleGameResource.create(
  idle_game: game_3,
  resource: nourriture,
  quantity: 0
)

IdleGameResource.create(
  idle_game: game_3,
  resource: fer,
  quantity: 0
)

# Games Structures

IdleGameStructure.create(
  idle_game: game_1,
  structure: hotel_de_ville,
  level: 3
)

IdleGameStructure.create(
  idle_game: game_1,
  structure: ferme,
  level: 2
)

IdleGameStructure.create(
  idle_game: game_1,
  structure: scierie,
  level: 2
)

IdleGameStructure.create(
  idle_game: game_1,
  structure: camp_militaire,
  level: 1
)

IdleGameStructure.create(
  idle_game: game_2,
  structure: hotel_de_ville,
  level: 2
)

IdleGameStructure.create(
  idle_game: game_2,
  structure: ferme,
  level: 1
)

IdleGameStructure.create(
  idle_game: game_2,
  structure: scierie,
  level: 2
)

IdleGameStructure.create(
  idle_game: game_2,
  structure: camp_militaire,
  level: 0
)

IdleGameStructure.create(
  idle_game: game_3,
  structure: hotel_de_ville,
  level: 1
)

IdleGameStructure.create(
  idle_game: game_3,
  structure: ferme,
  level: 0
)

IdleGameStructure.create(
  idle_game: game_3,
  structure: scierie,
  level: 0
)

IdleGameStructure.create(
  idle_game: game_3,
  structure: camp_militaire,
  level: 0
)
