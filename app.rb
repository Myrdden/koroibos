ENV['SINATRA_ENV'] ||= 'development'
ENV['RACK_ENV'] ||= 'development'
ENV['SINATRA_ACTIVESUPPORT_WARNING'] = 'false'

require 'bundler/setup'
require 'sinatra/activerecord'
require 'sinatra/namespace'
Bundler.require :default, ENV['SINATRA_ENV']

require_all 'app'
