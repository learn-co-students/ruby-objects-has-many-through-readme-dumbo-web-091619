require 'pry'
class Waiter
attr_reader :name
attr_accessor :yrs_experience
@@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer,total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        best_tip = self.meals.max_by {|meal| meal.tip}.customer
        # best_tip[0]
        # binding.pry
    end
end