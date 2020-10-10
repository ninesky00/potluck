require 'minitest/autorun'
require './lib/dish'
require './lib/potluck'

class PotluckTest < Minitest::Test
    def setup
        @potluck = Potluck.new("7-13-18")
        @couscous_salad = Dish.new("Couscous Salad", :appetizer)
        @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
     
    end
    
    def test_potluck_exist
        assert_instance_of Potluck, @potluck
    end

    def test_initialized_attributes
        assert_equal "7-13-18", @potluck.date
        assert_equal [], @potluck.dishes
    end

    def test_can_add_dishes
        @potluck.add_dish(@couscous_salad)
        @potluck.add_dish(@cocktail_meatballs)

        expected = []
        expected << @couscous_salad
        expected << @cocktail_meatballs
        assert_equal expected, @potluck.dishes
        assert_equal 2, @potluck.dishes.length
    end


    
end