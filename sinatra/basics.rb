require 'sinatra'

get '/' do
    "Hello, World!"
end

get '/about' do
    'A little about me.'
end

get '/hello/:name' do
    "Hello there, #{params[:name].upcase}."
end

get '/hello/:name/:city' do
    "Hey there #{params[:name]} from #{params[:city]}."
end

get '/more/*' do
    params[:splat];
end

get '/form' do
    erb :form
end

post '/form' do
    "You said '#{params[:message]}'"
end

not_found do
    halt 404, 'page not found'
end
