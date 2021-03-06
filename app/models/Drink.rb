#class for Model2 goes here
#Feel free to change the name of the class
class Drink
    attr_reader :name, :price, :customer, :bartender

    @@drinks = []

    def initialize(name, price, customer, bartender)
        @name = name
        @price = price
        @customer = customer
        @bartender = bartender
        @@drinks << self
    end

    def self.all 
        @@drinks
    end 

    # def self.most_popular
    #     arr = self.all.map do |d| 
    #         d.name
    #     end 
    #     arr.max_by{ |d| d.count(d)}
    # end

    def self.drink_count(drink_name)
        self.all.select do |d|
            d.name == drink_name
        end.count
    end 

    def self.most_popular
        self.all.max_by do |d|
            self.drink_count(d.name)
        end.name
    end 

    


    # def self.most_popular
    #     arr = self.all.map do |d| 
    #         d.name
    #     end 
    #     most_popular = nil   
    #     most_drink_count = 0  
    #     arr.uniq.each do |d1|
    #         count = 0 
    #         arr.each do |d2|
    #             if d2 == d1 
    #                 count += 1 
    #             end 
    #         end 
    #         if count > most_drink_count
    #             most_drink_count = count
    #             most_popular = d1 
    #         end 
    #     end
    #     most_popular
    # end

    def self.least_popular
        self.all.min_by do |d|
            self.drink_count(d.name)
        end.name 
    end

    def self.most_expensive
        self.all.max_by {|d| d.price}.name
    end 

    def self.least_expensive
        self.all.min_by {|d| d.price}.name
    end
end
