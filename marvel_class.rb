#!/usr/bin/env ruby
require 'httparty'
#fix hash
class Marvel
  include HTTParty
  
  ts=10
  apikey="98dff8d8fcd1870e5fe5ba9cc0176070"
  @string="ts=#{ts}&apikey=#{apikey}&hash=#{hash}"
  base_uri "http://gateway.marvel.com/v1"

  
  attr_accessor :name
  attr_reader :id, :description

  def initialize(id,name,description)
    @id = id
    @name = name
    @description = description
  end

  def self.find(name)
    response = get("/public/characters?name=#{name}&"+ @string)
    if response.success?
	data = response["data"]
	results = data["results"]
	results_hash = Hash[*results]
      self.new(results_hash["id"],results_hash["name"],results_hash["description"])
    else
      raise response.response
    end
  end
end

#character = Marvel.find("Hulk")
#puts character.id
#puts character.name
#puts character.description
