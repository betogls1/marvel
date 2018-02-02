#!/usr/bin/env ruby
require './marvel_class'
char_name = ARGV
char_name = char_name.join(",")
char_name = char_name.gsub(","," ")
character = Marvel.find(char_name)
puts character.id
puts character.name
puts character.description
