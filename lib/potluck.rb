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
end