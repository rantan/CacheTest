# -*- coding: utf-8 -*-
require 'sinatra'

def get_response
  time = "#{Time.now}"
end

get '/no_cache' do
  cache_control :must_revalidate, :private, :max_age => 0
  content_type :json, :charset => 'utf-8'
  get_response
end

get '/cache' do
  # cache_control :must_revalidate, :public, :max_age => 60
  cache_control :private, :max_age => 60
  content_type :json, :charset => 'utf-8'
  get_response
end

get '/no_header' do
  content_type :json, :charset => 'utf-8'
  get_response
end
