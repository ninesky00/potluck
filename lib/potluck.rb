require 'pry'
class Potluck
    attr_reader :date, :dishes
    def initialize(date)
        @date = date
        @dishes =[]
    end

    def add_dish(new_dish)
        @dishes.push new_dish
    end

    def get_all_from_category(category)
        @dishes.select {|dish| dish.category == category}
    end

    def menu
        dish_names = {}
        @dishes.sort_by! {|dish| dish.name}
        @dishes.each do |dish| 
        dish_names[dish.category] ||= []
        dish_names[dish.category] << dish.name
        end
        dish_names
    end

    def ratio(category)
        (get_all_from_category(category).count * 100 / @dishes.length).round(2)
    end
end
