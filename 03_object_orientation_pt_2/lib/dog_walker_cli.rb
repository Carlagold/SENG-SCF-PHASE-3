def start_cli
  puts "Hi there! Welcome to the Dog Walker CLI!".cyan
end
  
# ✅ add 2 additional options for walking and feeding dogs
def print_menu_options 

  puts "================================"
  puts "  1. List all dogs "
  puts "  2. Add a dog "
  puts "  3. Feed a dog"
  puts "  4. Walk a dog "
  puts "  5. To view dogs that need walking"
  puts "  6. To view dogs that are hungry"
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
  
  # define a method `list_dogs` that will iterate over an array of
  # dog hashes and call print_dog on each one.
def list_dogs(dogs)
  dogs.each do |dog| 
    dog.print
  end
  nil
end

# ✅ Refactor
# define an `add_dog` method which accepts an array of dog
# instances as an argument. It should:
# ask the user for input of the
# dog's name, age, breed and image_url. 
# Take this information and use it to create a new instance
# of the dog class 
# add the new instance to the dogs array passed as an argument
# print the newly added dog (by invoking dog.print)
  
def add_dog(dogs)
  puts "What's the Dog's name?  "
  name = ask_for_input
  puts "What's the Dog's Age?  "
  age = ask_for_input
  puts "What's the Dog's Breed?  "
  breed = ask_for_input
  puts "What's the Dog's Image Url?  "
  image_url = ask_for_input

  dog = Dog.create(name: name, age: age, breed: breed, image_url: image_url)
  dog
end

# ✅ Refactor: 
# 1. We're going to remove all references to $dogs within this method because the Dog class is now taking ownership of managing collections of dogs
# 2. within the logic for handling choice 5 for dogs that need walking, we'll list only dogs that need a walk
# 3. within the logic for handling choice 6 for dogs that are hungry, we'll list only dogs that are hungry

def handle_choice
  user_input = ask_for_input

  if user_input == "1"
    list_dogs(Dog.all)
  elsif user_input == "2"
    add_dog(Dog.all)
  elsif user_input == "3"
    feed_dog(Dog.all)
  elsif user_input == "4"
    walk_dog(Dog.all)
  elsif user_input == "5"
    # ✅ list dogs that need walking
    list_dogs(need_walking_list(Dog.all))
  elsif user_input == "6"
    # ✅ list dogs that are hungry
    list_dogs(need_food_list(Dog.all))
  else
    system('clear')
    puts "I didn't recognizer your command try again".red
  end
end

def need_walking_list(dogs)
  dogs.filter do |dog|
    dog.needs_a_walk?
  end
  # dogs.filter(&:needs_a_walk?) Shorthand for what you see above
end

def need_food_list(dogs)
  dogs.filter do |dog|
    dog.needs_a_meal?
  end
  # dogs.filter(&:needs_a_walk?) Shorthand for what you see above
end

def choose_dog_from_collection(dogs)
  dogs.each_with_index do |dog, index|
    puts "#{index+1}. #{dog.name} (#{dog.breed})"
    # ✅ print out a number using each dog's index and its name (breed)
  end
  puts "Type the number associated with the dog you'd like to choose"
  # this code converts the number typed by the user and stored as a string
  # to an integer and then subtracts 1 to get the corresponding index in
  # the dogs array
  index = ask_for_input.to_i - 1
  # next we check if we got a valid choice and if not, we'll show an error 
  # and ask the user to choose again by invoking the method again.
  # we add index >= 0 to our condition because .to_i will return 0 if passed
  # a word that doesn't start with a number as an argument.
  # in that case, we'll end up with -1 and we'd prefer telling the user there
  # was a problem to doing dogs[-1] which actually returns the last dog in the array
  if index >= 0 && index < dogs.length
    dogs[index]
  else
    puts "Whoops! We couldn't find a dog matching your choice.".red
    puts "Please try again"
    choose_dog_from_collection(dogs)
  end
end

# ✅ Add a `walk_dog` method that will prompt the user to choose
# which dog to walk. After choosing a dog, invoke the `walk` method
# on the dog and then `print` it
def walk_dog(dogs)
  dog = choose_dog_from_collection(dogs)
  dog.walk
  dog.print
end

def feed_dog(dogs)
  dog = choose_dog_from_collection(dogs)
  dog.feed
  dog.print
end



# ✅ Add a `feed_dog` method that will prompt the user to choose
# which dog to feed. After choosing a dog, invoke the `feed` method
# on the dog and then `print` it
  