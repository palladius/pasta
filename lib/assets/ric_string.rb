

class String

  def trim
    self.gsub(/^\W+/,'').gsub(/\W+$/,'')
  end
end
