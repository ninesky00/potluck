require 'minitest/autorun'
require './lib/dish'

class DishTest < Minitest::Test
    def setup
        @dish = Dish.new("Couscous Salad", :appetizer)
    end

    def test_has_name_and_category
        assert_equal "Couscous Salad", @dish.name
        assert_equal :appetizer, @dish.category
    end
end