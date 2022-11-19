class IngredientSauce < ApplicationRecord

  #attr_accessible :necessary, :notes, :sauce_id, :ingredient_id

  belongs_to :sauce      #, :foreign_key => 'followed_id' , :class_name => 'Person'
  belongs_to :ingredient # youre the follower
  validates_presence_of   :sauce, :ingredient
  validates_uniqueness_of :sauce_id, :scope => :ingredient_id
  #validates_inclusion_of :vote,  :in => 0..100, :message => "Percentage (0..100)"


  def self.emoji
    '🍅'
  end
end
