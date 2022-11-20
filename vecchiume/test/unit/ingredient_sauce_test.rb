require 'test_helper'

class IngredientSauceTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert IngredientSauce.new.valid?
  end
end
