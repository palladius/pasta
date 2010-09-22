# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  PastaModels = [ Event, Guest, Ingredient, IngredientSauce, Pasta, PastaSauce, User ]
  
  def visualize_tags(tags_string)
    tags_string.split(',').map{ |tag|
      tag = tag.trim
       link_to(tag, "/tags/#{tag}")
    }.join ' '
  end
  
end


class String
  
  def trim
    self.gsub(/^\W+/,'').gsub(/\W+$/,'')
  end
  
end