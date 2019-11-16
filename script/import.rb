require 'rlua'
require 'pry'
require 'lua_script/importer'

state = Lua::State.new
state.__load_stdlib :all

root_path = Rails.root.to_s
lua_string = File.open("#{root_path}/lua/Test1.lua", "r").read.encode("UTF-8", "Shift_JIS")
project = Project.find(3)
importer = LuaScript::Importer.new(project, lua_string)
binding.pry
p importer.import
