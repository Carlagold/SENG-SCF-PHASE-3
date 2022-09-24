class Dog
 
    attr_accessor :name, :age, :breed, :image_url, :nick_name, :last_fed_at, :last_walked_at

    def initialize(name, age, breed, image_url, last_fed_at = Time.now, last_walked_at = Time.now) 
        @name = name
        @age = age
        @breed = breed
        @image_url = image_url
        @last_fed_at = last_fed_at
        @last_walked_at = last_walked_at
    end

    def bark
        puts "#{@name} says: Woof! Woof!!!"
    end

    def print
        puts "#{self.name}".cyan
        puts "  Nick Name: #{self.nick_name}".green
        puts "  Age: #{self.age}"
        puts "  Breed: #{self.breed}"
        puts "  Image URL: #{self.image_url}"
        puts "  Last Fed At: #{self.last_fed_at}"
        puts "  Last Walked At: #{self.last_walked_at}"
    end
    
    def feed
        self.last_fed_at = Time.now
    end


    def walk
        self.last_walked_at = Time.now
    end
    
    def needs_a_meal?
        if self.last_fed_at 
            !last_fed_at.between?(6.hours.ago, Time.now)
        else
            true
        end
    end

    def needs_a_walk?
        if self.last_walked_at 
            !last_walked_at.between?(4.hours.ago, Time.now)
        else
            true
        end
    end
   
end