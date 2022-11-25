class Pasta < ApplicationRecord

  # hobo_model # Don't put anything above this

  # fields do
  #   name        :string
  #   description :text
  #   active      :boolean, :default => true
  #   timestamps
  # end

  validates_uniqueness_of :name, :message => "must be unique"

  def to_html()
    "<span class='pasta'><b>#{to_s}</b></span>\n"
  end

  def to_s
    name.capitalize.gsub(/_/,' ')
  end

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

  def wikipedia_link
    "https://en.wikipedia.org/wiki/#{name}"
  end

  def self.emoji
    '🍝'
  end

end
