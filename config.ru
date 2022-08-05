require "sinatra"

class App < Sinatra::Base
  set :default_content_type, "application/json" # won't return html
  # get "/hello" do
  #   "<h2>Hello <em>World</em>!</h2>"
  # end
  # get "/potato" do
  #   "<p>Boil 'em, mash 'em, stick 'em in a stew</p>"
  # end
  # get "/dice" do
  #   "<h2>You rolled a #{rand(1..6)}</h2>"
  # end
  get "/dice" do
    { roll: rand(1..6) }.to_json
  end
  get "/add/:num1/:num2" do
    { result: params[:num1].to_i + params[:num2].to_i }.to_json
  end
  get "/games/:id" do
    Game.find(params[:id]).to_json
  end
end

run App
