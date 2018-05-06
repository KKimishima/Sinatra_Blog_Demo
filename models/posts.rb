require "bundler/setup"
require 'active_record'
require 'sqlite3'

Time.zone = "Tokyo"
ActiveRecord::Base.default_timezone = :local

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development'])

class Posts < ActiveRecord::Base
end