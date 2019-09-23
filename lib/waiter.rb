class Waiter

    attr_reader :name
    attr_accessor :years_of_exp

    @@all = []

    def initialize(name, years_of_exp)
        @name = name
        @years_of_exp = years_of_exp
        @@all << self
    end

    def self.all    
        @@all
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def best_tipper
        big_tipped_meal = meals.max do |meal1, meal2|
            meal1.tip <=> meal2.tip
        end
        big_tipped_meal.customer

    end
 
end