#!/usr/bin/env ruby
require './marvel_class'
character= ARGV[0]
character = Marvel.find(character)
puts character.id
puts character.name
puts character.description
