require 'test_helper'

class IngredientSaucesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => IngredientSauce.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    IngredientSauce.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    IngredientSauce.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to ingredient_sauce_url(assigns(:ingredient_sauce))
  end
  
  def test_edit
    get :edit, :id => IngredientSauce.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    IngredientSauce.any_instance.stubs(:valid?).returns(false)
    put :update, :id => IngredientSauce.first
    assert_template 'edit'
  end
  
  def test_update_valid
    IngredientSauce.any_instance.stubs(:valid?).returns(true)
    put :update, :id => IngredientSauce.first
    assert_redirected_to ingredient_sauce_url(assigns(:ingredient_sauce))
  end
  
  def test_destroy
    ingredient_sauce = IngredientSauce.first
    delete :destroy, :id => ingredient_sauce
    assert_redirected_to ingredient_sauces_url
    assert !IngredientSauce.exists?(ingredient_sauce.id)
  end
end
