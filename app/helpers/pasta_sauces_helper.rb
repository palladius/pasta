module PastaSaucesHelper
  
  def cell_pasta_sauce(pasta,sauce)
	  ps = PastaSauce.find_by_pasta_id_and_sauce_id(pasta.id,sauce.id)
	  return image_tag(ps.appropriate ? 'green.png' : 'red.png', :height => 20 ) if ps	
	  return link_to( '.', 'pasta_sauces/new' ) # in mancanza
	end
	
	
	
end
