class DogWalk < ActiveRecord::Base
  belongs_to :dog
  belongs_to :walk

  scope :with_poop, -> { where(pooped: true) }

  
  delegate :formatted_time, to: :walk
  # def formatted_time
  #   self.walk.formatted_time
  # end
  
  delegate :age, to: :dog
  # def age
  #   self.dog.age
  # end

end