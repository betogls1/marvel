#!/usr/bin/env ruby
require 'httparty'
require 'securerandom'
require 'digest'
#fix hash
class Marvel
  include HTTParty
  include SecureRandom
  TS=SecureRandom.base64
  APIKEY="98dff8d8fcd1870e5fe5ba9cc0176070"
  #fix hash
  #HASH= Digest::MD5.hexdigest ""
  STRING="ts=#{TS}&apikey=#{APIKEY}&hash=#{HASH}"
  base_uri "http://gateway.marvel.com/v1"
  attr_accessor :name
  attr_reader :id, :description
  def initialize(id,name,description)
    @id = id
    @name = name
    @description = description
  end
  def self.find(name)
    response = get("/public/characters?name=#{name}&"+ STRING)
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
