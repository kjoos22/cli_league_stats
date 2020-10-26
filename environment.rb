require_relative './lib/api.rb'
require_relative './lib/cli.rb'
require_relative './lib/summoner.rb'
require_relative './lib/api_data.rb'

require 'pry'
require 'net/http'
require 'json'
require 'dotenv'
Dotenv.load('./.env')