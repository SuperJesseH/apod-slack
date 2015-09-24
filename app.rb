# encoding: utf-8
require "sinatra"
require "json"
require "httparty"
require "redis"
require "dotenv"


configure do
  # Load .env vars
  Dotenv.load
  # Disable output buffering
  $stdout.sync = true

  # Set up redis
  case settings.environment
  when :development
    uri = URI.parse(ENV["LOCAL_REDIS_URL"])
  when :production
    uri = URI.parse(ENV["REDISCLOUD_URL"])
  end
  
  $redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)
  end

get "/" do
  "Science!"
end

post "/" do
  response = ""
  response = { text: send_apod }
  response[:username] = ENV["BOT_USERNAME"] unless ENV["BOT_USERNAME"].nil?
  response[:icon_emoji] = ENV["BOT_ICON"] unless ENV["BOT_ICON"].nil?
  response = response.to_json

  status 200
  body response
end

def send_apod
  reply = ""
  uri = "https://api.nasa.gov/planetary/apod?concept_tags=False&api_key=#{ENV["NASA_API_KEY"]}"
  request = HTTParty.get(uri)
  puts "[LOG] #{request.body}"
  response = JSON.parse(request.body)
  if response["url"]
    @url = response["url"]
    @explanation = response["explanation"]
    @title = response["title"]
    reply = "#{@url} \n*#{@title}* \n#{@explanation}"
  else
    reply = "Error when accessing NASA API"
  end
  reply
end
