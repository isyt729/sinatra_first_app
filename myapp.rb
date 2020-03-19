require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",
  host:     "localhost",
  username: "root",
  password: "",
  database: "sinatra_practice",
  socket: "/tmp/mysql.sock"
)

class Comment < ActiveRecord::Base
end
 
get "/" do 
  @comments = Comment.all
  erb :index
end

post "/new" do 
  Comment.create({body: params[:body]})
  redirect '/'
end

post "/delete" do
  puts params
  Comment.find(params[:id]).destroy
  redirect '/'
end