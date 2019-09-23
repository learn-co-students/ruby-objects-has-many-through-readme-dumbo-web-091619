=begin

Customer [independent]
0) @@all = []
1) initialize with a name(attr_reader) and age(attr_reader), store in @@all array
2) self.all => @@all
3)
4)
5)
6)
7)
7)
9)

Waiter [independent]
0) @@all = []
1) 
2) self.all => @@all
3)
4)
5)
6)
7)
7)
9)

Meals [joiner]
0) @@all = []
1) initialize with instances of the customer and the waiter that way we can pull data for the others from this relationship
# a new meal instance will automatically be linked to a customer and waiter and can use methods to select,find,map over this matching the waiter or customer or both. 
2) self.all => @@all
3)
4)
5)
6)
7)
7)
9)



=end