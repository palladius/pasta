module PastaSaucesHelper

  def cell_pasta_sauce(pasta,sauce)
	  ps = PastaSauce.find_by_pasta_id_and_sauce_id(pasta.id,sauce.id)
	  #return image_tag(ps.appropriate ? 'green.png' : 'red.png', :height => 20 ) if ps
	  return ps.appropriate_emoji if ps
	  return link_to(
			'+',
			"/pasta_sauces/new?pasta_id=#{pasta.id}&sauce_id=#{sauce.id}&notes=autocreated&vote=42",
			:title => "Create new PastaSauce association for '#{pasta}' with '#{sauce}'.\nMake sure you consult a true Italian before perturbating the Universe Status Quo" ) # in mancanza
	end

	def render_matrix_cell(pasta,sauce)
		:TODO
	end



end
