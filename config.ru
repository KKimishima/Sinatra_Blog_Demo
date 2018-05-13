require "bundler/setup"
require 'sinatra/base'
require 'sinatra/contrib'
require "sinatra/activerecord"
require "date"

# require "./app/controller/app_controller"
# require "./app/controller/archive_controller"
# require "./app/controller/edit_controller"
# require "./app/controller/login_controller"
# require "./app/controller/login_controller"
# require "./app/controller/page_controller.rb"
# require "./app/controller/show_controller"
#
# require "./app/helpers/app_helper"
#
# require "./app/models/posts"
# require "./app/models/users"


Dir[File.dirname(__FILE__) + '/app/{models,helpers,controller}/*.rb'].each {|file| require file }

ROUTERS ={
    "/" => AppController,
    "/edit" => EditController,
    "/show" => ShowController,
    "/page" => PageController,
    "/login" => LoginController,
    "/archive" => ArchiveController
}

run Rack::URLMap.new(ROUTERS)