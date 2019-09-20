class Waiter   
  attr_reader :name, :age
  @@all=[]
   def initialize(name, age)
     @name=name
     @age=age
     @@all << self
   end
   def self.all
    @@all
   end
   def new_meal(cust, total, tip)
    Meal.new(self, cust, total, tip)
   end
   def meals
    Meal.all.select{|meal|
    meal.waiter == self}
   end
   def best_tipper
    besttip = Meal.all.map{|meal|
    meal.tip}.max
    Meal.all.find{|meal|
    meal.tip==besttip}.customer
   end
end