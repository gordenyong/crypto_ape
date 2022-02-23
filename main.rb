require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'bcrypt'
require 'httparty'

# allows session hash to work
enable :sessions

require_relative 'db/db'

# MODELS
require_relative 'models/user'
require_relative 'models/coin'


# CONTROLLERS
require_relative 'controllers/coin_controller'
require_relative 'controllers/user_controller'
require_relative 'controllers/sessions_controller'

# HELPER
require_relative 'helpers/sessions_helper'




