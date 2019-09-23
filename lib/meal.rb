class Meal
@@all = []

# attr_reader 
attr_accessor :waiter, :customer, :tip, :total, :customer

    def initialize(waiter, customer, total, tip=0)
        @waiter = waiter
        @customer = customer
        @tip = tip
        @total = total
        @@all << self
    end

    def self.all
        @@all
    end

end