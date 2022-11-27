class Ingredient < ApplicationRecord

  # default sorting :)
  #https://stackoverflow.com/questions/3393687/rails-default-sort-order-for-a-rails-model
  default_scope { order(name: :asc) }

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
