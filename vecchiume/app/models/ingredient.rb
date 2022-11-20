class Ingredient < ActiveRecord::Base
  attr_accessible :name, :description, :tags
  validates_uniqueness_of :name, :message => "must be unique"
  
  def self.seed(name,tags,description='ARGH. No desc in seed!')
    create(
      :name         => name,
      :description  => description,
      :tags         => tags # '_seed, pasta'
    )
  end
  
  def to_s
    name
  end
end
