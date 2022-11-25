class Sauce < ApplicationRecord

  # hobo_model # Don't put anything above this

  # fields do
  #   name        :string
  #   description :text
  #   active      :boolean, :default => true
  #   color       :string,  :default => 'rosso' # rosso, bianco, ...
  #   timestamps
  # end

  has_many :ingredients
  validates_uniqueness_of :name, :message => "must be unique"

  def to_html()
    "<font color='#{smart_color}' >#{to_s}</font>\n"
  end

  # def to_s(html_mode)
  #   html_mode ? to_html() : name
  # end
  def to_s
    name.capitalize.gsub(/_/,' ')
  end

  def smart_color()
    return 'gray'         if name =~ /panna|zucchine|formagg/ # white doesnt show
    return 'black'        if name =~ /nero/
    return 'pink'         if name =~ /salmone/
    return 'darkgreen'    if name =~ /pesto/
    return 'brown'        if name =~ /ragu|funghi|bologn|cinghiale|chicken|pollo/
    return 'purple'       if name =~ /radicchio/
    return 'gold'         if name =~ /aglio_olio|brodo|burro/
    return 'gold'         if name =~ /carbonara/
    'red'
  end
  # italian preposition
  def connettivo
    return '' if name =~ /gamberetti.zucchine|panna.funghi/
    # plurali
    return "ai"   if name =~ /i$/
    #return "alle"   if name =~ /^[e]^[s]e$/
    # singolari con caduta di vocale
    return "all'" if name =~ /^[aeiou]/
    # altri singolari
    return 'allo' if name =~ /scoglio/
    return "al"   if name =~ /[ou]$/     # removed &ugrave;
    "alla"
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

  def self.emoji
    '🍝'
  end

end
