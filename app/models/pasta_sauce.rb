

class PastaSauce < ActiveRecord::Base

  def self.emoji
    '🥫' # 🍅
  end
  # hobo_model # Don't put anything above this

  # fields do
  #   appropriate :boolean, :default => true
  #   vote        :integer, :default => 50
  #   notes       :text
  #   pasta_id    :integer
  #   sauce_id    :integer
  #   timestamps
  # end

  belongs_to :sauce #, :foreign_key => 'followed_id' , :class_name => 'Person'
  belongs_to :pasta # youre the follower
  # validates_presence_of   :person, :followed
  # validates_uniqueness_of :followed_id, :scope => :person_id
  validates_presence_of   :sauce, :pasta
  validates_uniqueness_of :sauce_id, :scope => :pasta_id
  validates_inclusion_of :vote,  :in => 0..100, :message => "Percentage (0..100)"


  def to_s(html_mode=true)
    html_mode ?
      to_html :
      "#{appropriate_emoji} { #{pasta.to_s} #{sauce.connettivo} #{sauce.to_s} }" rescue "PastaSauceBw error: (''#{$!}'')"
  end

  def to_label
    "<b>LABEL</b>"
  end

  def anecdote_present?
    self.notes =~ /^💭/
  end

  def best_pasta_for_this_sauce?
    self.sauce.pasta == self.pasta # most appropriate combo for that sauce
  end

  def appropriate_emoji
    if anecdote_present?
      return appropriate ? '💭👍' : '💭🤮'
    end
    # appropriate ? '👍' : '⛔️'
    ret = appropriate ? '👍' : '🤮'
    ret += '⭐️' if best_pasta_for_this_sauce?
    ret
  end

  def to_html
    color = appropriate ? 'green' : 'red'
    #{}"<font color='#{color}'>#{to_s(false)}</font>"
    ret = "<font color='#{color}'>#{appropriate_emoji} </font>" +
    "#{pasta.to_html} #{sauce.connettivo} #{sauce.to_html}"
    # +
    #     " <small>#{vote}%</small>"
    ret.html_safe

  end

  def self.seed(pasta,sauce,appropriate,notes)
    create(
      :pasta_id    => Pasta.find_by_name(pasta).id ,
      :sauce_id    => Sauce.find_by_name(sauce).id ,
      :appropriate => appropriate,
      :vote        => appropriate ? 70 : 0 ,
      :notes       => notes
    )
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

end
