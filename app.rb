#!/usr/bin/env ruby

require 'rubygems'
require 'bundler'

environment = ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development'

Bundler.require

configure(:development) do |c|
  require 'sinatra/reloader'
  set :server_url, 'http://localhost:3000'
  set :port, 3000
end

configure(:production) do |c|
  set :server_url, 'http://whatdoweeattoday.llp.pl'
end

DATA = YAML.load(File.read('config/data.yml'))

def show(group)
  list = DATA[group.to_s]
  record = list.respond_to?(:sample) ? list.sample : list.choice
  @item = Hashie::Mash.new(record)
  erb(group)
end

get '/' do
  redirect '/order'
end

get '/order' do
  show(:places_to_order_from)
end

get '/spacer' do
  show(:places_to_go_to)
end
