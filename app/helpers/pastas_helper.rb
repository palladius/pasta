module PastasHelper


  def pasta_photo(r)
    image_tag( "pastas/#{r}.png" , :size => '50' ) + r.to_html
  end

  def sauce_photo(r)
    image_tag( "sauces/#{r}.png" , :size => '50' ) + r.to_html
  end

  def pasta_wikipedia_link(p)
    link_to p.wikipedia_link,p.wikipedia_link
  end


end
