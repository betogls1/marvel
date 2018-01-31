#!/usr/bin/env ruby
require 'httparty'

class Marvel
  include HTTParty
  
  ts=10
  apikey="98dff8d8fcd1870e5fe5ba9cc0176070"
  @string="ts=#{ts}&apikey=#{apikey}&hash=#{hash}"
  base_uri "http://gateway.marvel.com/v1"

  attr_accessor :name, :description, :id

  def initialize(name,description,id)
    self.name = name
    self.description = description
    self.id = id
  end
  
  def name
    response = self.class.get("/public/characters/#{id}?#{string}")
    if response.success?
      response
    else
      raise response.response
    end
  end

  def self.find(id)
    response = get("/public/characters/#{id}?"+ @string)
    if response.success?
      self.new(response["name"], response["description"], response["id"])
    else
      raise response.response
    end
  end
end

marvel = Marvel.find(1011334)
p marvel

#response = HTTParty.get("http://gateway.marvel.com/v1/public/characters?ts=10&apikey=98dff8d8fcd1870e5fe5ba9cc0176070&hash=b8be5e66bcc2d1f80ae7b9fe078c65f4")
#response = HTTParty.get("http://gateway.marvel.com/v1/public/characters?ts=#{ts}&apikey=#{apikey}&hash=#{hash}")
#response = HTTParty.get("http://rubygems.org/api/v1/versions/httparty.json")
#puts response[0]["number"]