class WelcomeController < ApplicationController
  def test
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=75000&units=imperial&APPID=6d92a52d217873dba53b59f7b7aea89a")

    
    @location = response['name']
    @country = response['sys']['country']
    @temperature = response['main']['temp']
    @weather_icon = response['weather'][0]['icon']
    @weather_words = response['weather'][0]['description']
    @cloudiness = response['clouds']['all']
    @windiness = response['wind']['speed']
    
  end

  def index
    if params[:zipcode] != '' && !params[:zipcode].nil?
      
     response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{params[:zipcode]}&units=imperial&APPID=6d92a52d217873dba53b59f7b7aea89a")

    
    @location = response['name']
    @country = response['sys']['country']
    @temperature = response['main']['temp']
    @weather_icon = response['weather'][0]['icon']
    @weather_words = response['weather'][0]['description']
    @cloudiness = response['clouds']['all']
    @windiness = response['wind']['speed']
    end
  end
end
