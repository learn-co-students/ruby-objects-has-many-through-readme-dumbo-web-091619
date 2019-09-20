require 'pry'
class Waiter

    attr_reader :name, :years_of_experience

    @@all = []

    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience
        @@all << self
    end
    
    def self.all
        @@all
    end


    def new_meal(customer, total, tip)
        Meal.new(waiter = self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        tippers = self.meals.sort_by do |meal|
            meal.tip
        end
        tippers[-1].customer
    end
end