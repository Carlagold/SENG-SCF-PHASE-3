class DogsController < ApplicationController
  
  get '/dogs' do

    if(params.include?("include_dog_walks"))
      Dog.all.to_json(
        :include => {
        dog_walks: {
          methods: [:formatted_time],
        }
      }, 
      :methods => [:age]
    )
    else
      Dog.all.to_json(methods: [:age])
    end

  end

  get '/dogs/:id' do 
    # WE EXPECT BACK THE DOG WITH THAT ID
    # RETUNS A DOG OBJECT IN X format
    dog = Dog.find_by(id: params[:id])
    if dog.nil?
      return "THE ID DOES NOT EXIST, PLEASE TRY AGAIN".to_json
    else  
      dog.to_json(
        :include => {
        dog_walks: {
          methods: [:formatted_time, :age],
        }
      }, 
      :methods => [:age]
    )
    end
    
  end

  private 

  # a method used to specify which keys are allowed through params into the controller
  # we use this method to create a list of what's permitted to be passed to .create or .update
  # within controller actions.
  def dog_params
    
  end

end