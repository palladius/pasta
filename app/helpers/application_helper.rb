module ApplicationHelper


  PastaModels = [  Ingredient, IngredientSauce, Pasta, PastaSauce, Sauce ] # Guest,
  #HiddenPastaModels = [ Event, User ] # Guest,

  def visualize_tags(tags_string)
    tags_string.split(',').map{ |tag|
      tag = tag.trim
       link_to(tag, "/tags/#{tag}")
    }.join ' '
  end

end


# moved to lib/
# class String

#   def trim
#     self.gsub(/^\W+/,'').gsub(/\W+$/,'')
#   end
# end
