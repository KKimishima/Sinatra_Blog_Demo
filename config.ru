require "bundler/setup"
require 'sinatra/base'
require 'sinatra/contrib'
require "sinatra/activerecord"
require "date"

Dir[File.dirname(__FILE__) + '/{models,helpers,controller}/*.rb'].each {|file| require file }

ROUTERS ={
    "/" => AppController,
    "/edit" => EditController,
    "/show" => ShowController,
    "/page" => PageController,
    "/login" => LoginController,
    "/archive" => ArchiveController
}

run Rack::URLMap.new(ROUTERS)