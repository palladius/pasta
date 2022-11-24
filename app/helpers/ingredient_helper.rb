
module IngredientHelper

  def render_ingredient_tags(ingredient)
    tags = ingredient.tags.split(', ')
    linked_tags = tags.map{|tag| link_to "##{tag}", "/ingredients?tag=#{tag}"}
    linked_tags.join(' ').html_safe
  end

end
