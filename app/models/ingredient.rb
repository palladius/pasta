class Ingredient < ApplicationRecord


  #attr_accessible :name, :description, :tags
  validates_uniqueness_of :name, :message => "must be unique"

  def self.seed(name,tags,description, emoji) # ='ARGH. No desc in seed!'
    create(
      :name         => name,
      :description  => description,
      :tags         => tags, # '_seed, pasta'
      :emoji        => emoji,
    )
  end

  def to_s
    "#{emoji} #{name}"
  end

  def self.emoji
    '🍍'
  end


end
