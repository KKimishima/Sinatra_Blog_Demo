require "bundler/setup"
require 'active_record'
require 'sqlite3'

# Time.zone = "Tokyo"
ActiveRecord::Base.default_timezone = :local

ActiveRecord::Base.configurations = YAML.load_file('./config/database.yml')
ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development'])
# ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['production'])
class Users < ActiveRecord::Base
end