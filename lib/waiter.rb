class Waiter

    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def customers
        meals.map do |meal|
            meal.customer
        end
    end

    def frequent_customer
        most_times_visited = 0
        frequent_customer = nil

        customers.each do |customer|
            if customers.count(customer) > most_times_visited
                most_times_visited = customers.count(customer)
                frequent_customer = customer
            end
        end
        frequent_customer
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end

        best_tipped_meal.customer
    end

    def worst_tipper
        worst_tipped_meal = meals.min do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end

        worst_tipped_meal
    end

    def self.most_experienced_waiter
        most_yrs_experience = 0
        most_experienced_waiter = nil

        self.all.each do |waiter|
            if waiter.yrs_experience > most_yrs_experience
                most_yrs_experience = waiter.yrs_experience
                most_experienced_waiter = waiter
            end
        end
        most_experienced_waiter
    end

    def self.least_experienced_waiter
        least_yrs_experience = 100
        least_experienced_waiter = nil

        self.all.each do |waiter|
            if waiter.yrs_experience < least_yrs_experience
                least_yrs_experience = waiter.yrs_experience
                least_experienced_waiter = waiter
            end
        end
        least_experienced_waiter
    end

    def self.most_experienced_waiter_average_tips
        array_of_tips = self.most_experienced_waiter.meals.map do |meal|
            meal.tip
        end
        average_tips_sum = array_of_tips.inject do |sum, tip|
            sum + tip
        end

        average_tips_sum.to_i / array_of_tips.length
    end

    def self.least_experienced_waiter_average_tips
        array_of_tips = self.least_experienced_waiter.meals.map do |meal|
            meal.tip
        end
        average_tips_sum = array_of_tips.inject do |sum, tip|
            sum + tip
        end

        average_tips_sum.to_i / array_of_tips.length
    end


end