module SaucesHelper




  def render_most_appropriate_pasta_for_sauce(sauce)
    return link_to(sauce.pasta) if sauce.pasta
    '-'
  end

end
