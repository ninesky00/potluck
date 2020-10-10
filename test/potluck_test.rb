require 'minitest/autorun'
require './lib/dish'
require './lib/potluck'

class PotluckTest < Minitest::Test
    def setup
        @potluck = Potluck.new("7-13-18")
        @couscous_salad = Dish.new("Couscous Salad", :appetizer)
        @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        @summer_pizza = Dish.new("Summer Pizza", :appetizer)
        @roast_pork = Dish.new("Roast Pork", :entre)
        @candy_salad = Dish.new("Candy Salad", :dessert)

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

        expected = [@couscous_salad, @cocktail_meatballs]
        assert_equal expected, @potluck.dishes
        assert_equal 2, @potluck.dishes.length
    end

    def test_show_dish_by_category_appetizer
        @potluck.add_dish(@couscous_salad)
        @potluck.add_dish(@summer_pizza)
        @potluck.add_dish(@roast_pork)
        @potluck.add_dish(@cocktail_meatballs)
        @potluck.add_dish(@candy_salad)
        
        expected = [@couscous_salad, @summer_pizza] 
        assert_equal expected, @potluck.get_all_from_category(:appetizer)
        assert_equal @couscous_salad, @potluck.get_all_from_category(:appetizer).first
        assert_equal "Couscous Salad", @potluck.get_all_from_category(:appetizer).first.name
    end
end