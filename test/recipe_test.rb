require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
  end

  def test_attributes
    assert_instance_of Recipe, @recipe1

    
    assert_equal "Mac and Cheese", @recipe1.name

    expected = {}
    assert_equal expected, @recipe1.ingredients_required
  end

  def test_it_can_add_ingredients_to_ingriedients_required
    @recipe1.add_ingredient(@ingredient1, 2)

    @recipe1.add_ingredient(@ingredient1, 4)

    @recipe1.add_ingredient(@ingredient2, 8)

    expected = {@ingredient1 => 6, @ingredient2=> 8}
    assert_equal expected, @recipe1.ingredients_required
  end

  def test_ingredients 
    @recipe1.add_ingredient(@ingredient1, 2)

    @recipe1.add_ingredient(@ingredient1, 4)

    @recipe1.add_ingredient(@ingredient2, 8)

    expected = [@ingredient1, @ingredient2]
    assert_equal expected, @recipe1.ingredients 
  end
end