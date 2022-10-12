class WalksController < ApplicationController

  get "/walks" do 
    if(params.include?('recent') && params.include?("include_dogs"))
      return Walk.recent.to_json(methods: :formatted_time, include: :dogs)
    elsif(params.include?("recent"))
      return Walk.recent.to_json(methods: :formatted_time)
    elsif (params.include?("include_dogs"))
      return Walk.all.to_json(methods: :formatted_time, include: :dogs)
    end
    
    Walk.all.to_json(methods: :formatted_time)
  end

  private 

  # a method used to specify which keys are allowed through params into the controller
  # we use this method to create a list of what's permitted to be passed to .create or .update
  # within controller actions.
  def walk_params
    
  end
end