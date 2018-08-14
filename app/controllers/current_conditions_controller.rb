class CurrentConditionsController < ApplicationController

	require 'httparty'

  def index

  	possible_weather_conditions = ['windy', 'cloudy', 'mostly cloudy', 'partly cloudy', 'clear', 'sunny', 'fair', 'hot']

		url = 'https://boulder-tubing-api.herokuapp.com/conditions'
		response = HTTParty.get(url)
		body = JSON.parse(response.body)

		# Here is the main conditional to tell you whether to go tubing or not today. Each case creates the data to get rendered in the current_conditions index view file.
		if body['temperature_f'] >= "85" and possible_weather_conditions.include? body['weather_condition'] and body['flow_rate_cfs'] >= 40 and body['flow_rate_cfs'] <= 300
			@go_tubing = "Make your life look like this!!"
			@img_url = "https://i.ytimg.com/vi/EZqQzuxLyzA/maxresdefault.jpg"
		else
			@go_tubing = "Don\'t go tubing today."

			if body['temperature_f'] < "85" then @temperature_message = "Its too cold" end

			if !possible_weather_conditions.include? body['weather_condition'] then @weather_message = "The weather is " + body['weather_condition'] end

			if body['flow_rate_cfs'] < 40
				@flow_message = "The river is too low"
			elsif body['flow_rate_cfs'] > 300
				@flow_message = "The river is too high"
			end

			@img_url = "https://www.sbs.com.au/food/sites/sbs.com.au.food/files/styles/full/public/1997-happy-sad-face-bread.jpg?itok=hwBABbdd"

		end
	end
end
