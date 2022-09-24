def start_cli
  puts "Hi there! Welcome to the Dog Walker CLI!".cyan
end
  
  # define a method `print_menu_options` which outlines the user's
  # choices. The choices will be displayed as a numbered list like so:
  #   1. List all dogs
  #   2. Add a dog
  # At any time, type "menu" to see these options again or "exit" to
  # leave the program
def print_menu_options 

  puts "================================"
  puts "  1. List all dogs "
  puts "  2. Add a dog "
  puts ""
  puts "Type exit to exit out at anytime"
  puts "================================"
end
  
  
  
  # define a method `ask_for_choice` which prompts the user for input
  # if the user types "exit" we'll print a message thanking them
  # for using the CLI and invoke exit to terminate the program
  # otherwise, return whatever the user typed in

def ask_for_input
  user_input = gets.chomp

  if user_input === "exit"
    puts "Thank you for using this CLI have a nice day!"
    exit
  end

  user_input
end
  
  
  
  # define a `print_dog` method that accepts a dog hash as a parameter
  # and prints out the dog's details that looks like this:
  # =begin
    
  # Lennon Snow
  #   Age: Almost 2
  #   Breed: Pomeranian
  #   Image URL: https://res.cloudinary.com/dnocv6uwb/image/upload/v1609370267/dakota-and-lennon-square-compressed_hoenfo.jpg
  
  # =end
  
def print_dog(dog_hash)
  # js - `${}` ruby - "#{}"
  puts "#{dog_hash[:name]}".cyan
  puts "  Age: #{dog_hash[:age]}"
  puts "  Breed: #{dog_hash[:breed]}"
  puts "  Image URL: #{dog_hash[:image_url]}"
end

  
  
  # define a method `list_dogs` that will iterate over an array of
  # dog hashes and call print_dog on each one.
def list_dogs 
  $dogs.each do |dog_hash| 
    print_dog(dog_hash)
  end
  nil
end

  
  # define an `add_dog` method which accepts an array of dog
  # hashes as an argument. It should:
  # ask the user for input of the
  # dog's name, age, breed and image_url. 
  # Take this information and put it into a hash
  # add the hash to the dogs array passed as an argument
  # print the newly added dog
  
def add_dog(dogs)
  puts "What's the Dog's name?  "
  name = ask_for_input
  puts "What's the Dog's Age?  "
  age = ask_for_input
  puts "What's the Dog's Breed?  "
  breed = ask_for_input
  puts "What's the Dog's Image Url?  "
  image_url = ask_for_input

  dog_hash = { name: name, age: age, breed: breed, image_url: image_url }

  dogs << dog_hash
  nil
end
  
  # define a method `handle_choice` which will take a `choice` as a 
  # parameter and handle it in the appropriate way based on the menu
  # option that was chosen
  
def handle_choice
  user_input = ask_for_input

  if user_input == "1"
    list_dogs
  elsif user_input == "2"
    add_dog($dogs)
  else
    system('clear')
    puts "I didn't recognizer your command try again".red
  end
end
  
  
  