# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)




#require '~/lib/ric.rb'
class Array
  def head
    self[0] # raise if empty
  end
  def tail # TBOPT
    cp = Array.new(self)
    cp.shift
    return cp
  end
end

SEED_VER = '1.4-20221124'
#DESTROY_ALL_BEFORE_SEEDING = false # in PROD to Spanner we shouldnt do this :) In dev we should..
DESTROY_ALL_BEFORE_SEEDING = Rails.env != 'production'

BAD_CONDIMENTS = [
  %w{spaghetti      bolognese us_carbonara }, # 🤢 Seriously you had finished all tagliatelle, fusilli, and penne in the house?!?
  #%w{pappardelle    salmone carbonara },  # not sure I could defend this in tribunal..
  %w{risotto        bolognese }, # pure blasphemy!
  %w{tortellini     pesto },   # 🤮 Yuk! How can you even CONSIDER that?
  %w{tagliatelle    pollo }, # so obvious its insulting to even write it down!
  %w{fusilli        pollo }, # changing pasta won't make it any better.
#  %w{ _ .           pollo }, # Anything (TODO implement me)
]

#
PASTA_ICONS = {
  'DEFAULT' => '🍝',
  # ------------
  'risotto' => '🍚',
  'tagliatelle' => '🍜',
  'caramelle' => '🍬',

  'linguine' => '👅',
  'orecchiette' => '👂',
  'fusilli' => '🧬',
  'conchiglie' => '🐚',

  'gnocchi' => '🥟',
  'tortellini' => '🥟',
  'tortelloni' => '🥟',
}

SAUCE_ICONS = {
  'chicken' => '🐓',
  'pesto' => '🌱',

}

# ireland
GOOD_CONDIMENTS_WORLDWIDE = {
  :ie => # 🇮🇪
    [
      %w{ gnocchi     dun_laoghaire }, # for Ireland:  (my invention)
    ],
  :uk => # 🇬🇧
    [
      %w{ fish        chips }, # although not a pasta, its still fun :)
    ],

}

GOOD_CONDIMENTS = [
  %w{ agnolotti      burro_salvia bolognese brodo }, # http://it.wikipedia.org/wiki/Agnolotti_piemontesi
  %w{ bucatini       amatriciana pomodoro },
  %w{ bigoli         luganega },
  #%w{ chitarre       caspio }, # caviar and beans, only my mum knows...
  %w{ conchiglie     pomodoro bolognese piselli },
  %w{ fusilli        bolognese pesto radicchio },
  %w{ garganelli     boscaiola nero_di_seppia bolognese quattro_formaggi },
  %w{ gnocchi        sorrentina quattro_formaggi }, # for Ireland: dun_laoghaire (my invention)
  %w{ gramigna       salsiccia bolognese },
  %w{ linguine       pesto },
  %w{ orecchiette    pesto nero_di_seppia piselli },
  %w{ paccheri       bolognese }, # http://it.wikipedia.org/wiki/Paccheri
  %w{ pappardelle    bolognese cinghiale boscaiola funghi } ,  # http://it.wikipedia.org/wiki/Pappardelle
  %w{ penne          aglio_olio amatriciana bolognese norma piselli puttanesca quattro_formaggi radicchio  } ,
  %w{ rigatoni       norma gricia bolognese boscaiola carbonara zozzona } ,
  %w{ risotto        carbonara funghi zafferano frutti_di_mare },
  %w{ spaghetti      aglio_olio amatriciana carbonara nero_di_seppia norma pesto pomodoro puttanesca scoglio tonno frutti_di_mare },
  %w{ strozzapreti    cinghiale pesto ragu }, # removed canocchie to simplify
  %w{ tagliatelle    bolognese funghi gamberetti_zucchine nero_di_seppia panna_funghi prosciutto burro_e_tartufo }, # http://it.wikipedia.org/wiki/Tagliatelle
  %w{ tagliolini     scoglio gamberetti_zucchine nero_di_seppia panna_funghi burro_e_tartufo salmone },
  %w{ tonnarelli     cacio_e_pepe carbonara }, # sinonimo di spaghetti alla chitarra https://it.wikipedia.org/wiki/Spaghetti_alla_chitarra
  %w{ tortellini     brodo panna },
  %w{ tortelloni     pomodoro burro_salvia },
 ]

INGREDIENTS_WITH_EMOJI = {
  # sets the type of an ingredient
  :eggs         => ['protein, animal', '🥚'],

  :bacon        => ["meat, fat", '🥓'], # whatever ..
  :pancetta     => ["meat, fat", '🥓'], # this should be the belly of the pig
  :guanciale    => ["meat, fat", '🥓'], # this is the cheek of the pig

  :chicken      => ['meat, illegal_with_pasta', '🐓'],
  :pollo        => ['meat, illegal_with_pasta', '🐓'],  # same as chicken, apologix for WETness.
  :minced_beef  => ['meat', '🍔'], #
  :luganega     => ['meat', '🌭'],
  :salsiccia    => ['meat, fat', '🌭'],

  :mozzarella   => ['cheese', '🥯'],
  :cheddar      => ['cheese', '🧀'],
  :cream        => ['milk', '🍦'], #
  :parmigiano   => ['cheese', '🧀'],

  :butter       => ['fat, condiment, animal_fat', '🧈'], #
  :oil          => ['fat, condiment, vegetarian_fat', '🛢️'], # olive_oil
  :margarine          => ['fat, condiment, vegetarian_fat', '🧈'],

  #:pesto        => ['sauce', '🌱'] ,

  :basil        => ['herb', '🌱'] ,
  :sage         => ['herb', '🌱'],

  :garlic       => ['spice', '🧄'], #
  :red_pepper   => ['spice', '🌶️'], #
  :black_pepper => ['spice', '◾️'], #
  :onions       => ['spice, vegetable', '🧅'],

  :melanzane    => ['vegetable', '🍆'], # melanzane, aubergine, eggplant
  :cucumbers    => ['vegetable', '🥒'], #
  :green_pepper => ['vegetable', '🫑'], #
  :mushrooms    => ['vegetable', '🍄'], #
  :celery       => ['vegetable', '🥬'],
  :carrots      => ['vegetable', '🥕'], #
  :potatoes     => ['vegetable', '🥔'], # unhealthy veg - its actually a tuberus
  :tomato_sauce => ['vegetable', '🥫'], #
  :corn         => ['vegetable, illegal_with_pasta', '🌽'],

  :pinenuts => ['nuts','🥜'],
  :peanuts => ['nuts','🥜'],
  #:pine_nuts => ['nuts','🥜'],

  # FISH
  :fresh_tuna   => ['fish', '🍣'], #
  :tin_tuna     => ['fish', '🐟'],
  :octopus      => ['fish', '🐙'], #
  :scampi       => ['fish', '🦐'], #
  :salmon       => ['fish,healthy', '🍣'], #
  :shrimps      => ['fish', '🍤'],

  # alcohol
  :wine         => ['alcohol', '🍷'],
  :red_wine     => ['alcohol', '🍷'],
  :white_wine   => ['alcohol', '🥂'],

  # weird
  :truffle       => ['vegetable', '🍄'],
}

INGREDIENT_SAUCES = {
  :carbonara => %w{ eggs guanciale }, # plus salt pepper
  :us_carbonara => %w{ eggs bacon cream onions },
  :bolognese => %w{ tomato minced_meat wine onion carrots celery }, #someone puts milk
  :chicken => %w{ cream chicken },
  :sorrentina => %w{ mozzarella pomodoro },
  :pesto => %w{ basil oil pinenuts parmigiano },
  :norma => %w{ melanzane pomodoro ricotta }, # https://it.wikipedia.org/wiki/Pasta_alla_Norma
  :burro_e_tartufo => %w{ butter truffle },
}

# TODO(ricc): add this anecdotal in find_or_create.. by adding this to the info and surfacing the info in the matrix with a comicbook
# 💭
ANECDOTAL_INFORMATION = [
  [:bigoli, :luganega, "💭 famous fraternity song: Me piaze i bigoli con la luganega https://www.folkmusicworld.com/me-piaze-bigoli-con-la-luganega-musica-folk-trentina"],
  [:spaghetti, :bolognese, "💭 This is as insulting to Italians as Pineapple on pizza. Some sites to prove this: http://146.148.31.85/joomla/index.php?option=com_content&view=article&id=177:spaghetti-bolognese-dont-exist&catid=30:english-contents&Itemid=67 and https://www.italymammamia.com/spaghetti-bolognese-does-not-exist-in-italy.html and https://www.insider.com/spaghetti-bolognese-does-not-exist-says-mayor-of-bologna-italy-2019-3#:~:text=Rather%20than%20%22spaghetti%20bolognese%2C%22,their%20equivalent%20meat%2Dbased%20sauce.&text=However%20it's%20rarely%20served%20with,the%20sauce%2C%20such%20as%20tagliatelle"],
  [:tagliatelle, :bolognese, "This is the most typical way to use Ragu Bolognese as a pasta in Bologna: homemade egg tagliatelle! Did you know Emilia is famous for egg pasta with distinct yellow color? google 'Emiliane Barilla' if you dont believe me"],
  [:risotto, :carbonara, "I recently learnt this is also ok: https://blog.giallozafferano.it/pippicalzina/risotto-alla-carbonara/"]
]

# Best pasta for a certain sauce (note thaty I havent modelled the best sauce for a certain pasta yet. Sounds arrogant to me)
# Note that first I should have the sauce, buts its more readabale the other way around (at least for italian genitives).
# So its f(2) = 1.
BEST_WITH = [
  %w{bigoli luganega},
  %w{trenette pesto},
  %w{tagliatelle bolognese},
  %w{tagliatelle ragu},
  %w{bucatini amatriciana},
  %w{spaghetti carbonara},
  %w{rigatoni gricia}, # Or MEzzeManiche: https://www.casapappagallo.it/ricette/gricia or rigatoni https://www.tavolartegusto.it/ricetta/pasta-alla-gricia/
  %w{gramigna salsiccia},
  %w{risotto  zafferano},
  %w{tonnarelli cacio_e_pepe},
  #  Norma -<> Maccheroni: https://it.wikipedia.org/wiki/Pasta_alla_Norma, sedani: https://ricette.giallozafferano.it/Spaghetti-alla-Norma.html
  %w{rigatoni norma}, # https://fooby.ch/it/ricette/21710/pasta-alla-norma-?startAuto1=0 and https://www.cucchiaio.it/ricetta/ricetta-pasta-norma/
  %w{penne quattro_formaggi},
  %w{tagliolini salmone},
  %w{gnocchi        sorrentina},
  %w{rigatoni zozzona}, # https://ricette.giallozafferano.it/Pasta-alla-zozzona.html + https://www.cucchiaio.it/ricetta/pasta-alla-zozzona/ + https://a-modo-mio.it/pasta-alla-zozzona/
  %w{spaghetti scoglio},
  %w{spaghetti puttanesca},
  %w{spaghetti aglio_oglio},
]

  # check everything is ok
$extracted_pastas = (GOOD_CONDIMENTS + BAD_CONDIMENTS).map{|x| x[0] }.sort
$extracted_sauces = (GOOD_CONDIMENTS + BAD_CONDIMENTS).map{|x| x.tail }.flatten.sort.uniq
#assert_equal PASTAS.sort, $extracted_pastas.sort

puts $extracted_pastas.join ', '
puts $extracted_sauces.join ', '

#exit 1

if (DESTROY_ALL_BEFORE_SEEDING)
  print "!!!BEWARE!!! Destroying every pasta/sauce/association in the DB... "
  Pasta.delete_all
  Sauce.delete_all
  PastaSauce.delete_all
  Ingredient.delete_all
  IngredientSauce.delete_all
  puts "Done."
end

  # PASTAs
print "+ Creating pasta: "

#PASTAS.each{ |pasta_name|
$extracted_pastas.each{ |pasta_name|
  p = Pasta.create(
    :name => pasta_name ,
    :description => "Created via seed v. #{SEED_VER}",
    :emoji => PASTA_ICONS.fetch(pasta_name, '🍝'),
  )
  print "#{p}, "
}
puts '.'

  # SUGHI

print "+ Creating sauces: "
$extracted_sauces.each{ |sauce_name|
  s = Sauce.create(
    :name => sauce_name ,
    :description => "Created via seed v. #{SEED_VER}"
  )
  print "#{s}, "
}
puts '.'

BAD_CONDIMENTS.each{|pasta_sauces|
  pasta  = pasta_sauces.head
  sauces = pasta_sauces.tail
  print "  - Unsuggesting '#{pasta}' to: "
  sauces.each do |sauce|
    print "#{sauce}, "
    PastaSauce.seed( pasta,      sauce,      false,      "Created via seed v. #{SEED_VER}" )
  end
  puts " # End '#{pasta}'"
}
GOOD_CONDIMENTS.each{|pasta_sauces|
  pasta  = pasta_sauces.head
  sauces = pasta_sauces.tail
  print "  + Associating '#{pasta}' to: "
  sauces.each do |sauce|
    print "#{sauce}, "
    PastaSauce.seed(
      pasta,
      sauce,
      true,
      "Created via seed v. #{SEED_VER}"
    )
  end
  puts " # End '#{pasta}'"
}

  # Create ingredients (onion, tomato, ...)
# INGREDIENTS.each{|ingredient, tags|
#   puts "  + Inserting '#{ingredient}' --> '#{tags}'"
#   Ingredient.seed(ingredient.to_s, tags, "Created via seed v. #{SEED_VER}" )
# }
INGREDIENTS_WITH_EMOJI.each{|ingredient, tags_and_maybe_emoji|
  tags = tags_and_maybe_emoji[0]
  emoji = tags_and_maybe_emoji[1] # rescue nil
  puts "  + #{emoji} Inserting '#{ingredient}' --> '#{tags}' "
  Ingredient.seed(ingredient.to_s, tags, "Created via seed v. #{SEED_VER}", emoji )
  # Ingredient.create(
  #   ingredient.to_s,
  #   tags,
  #   "Created via seed v. #{SEED_VER}" )
}


# INGREDIENT_SAUCES = {
#   :carbonara => %w{ eggs guanciale },
#   :chicken => %w{ cream chicken },
# }
INGREDIENT_SAUCES.each do |sauce, ingredients|
  ingredients.each do |ingredient|
    IngredientSauce.create(
      :sauce => Sauce.find_by_name(sauce.to_s),
      :ingredient => Ingredient.find_by_name(ingredient),
      :notes =>  "Created via seed v. #{SEED_VER}",
      :necessary => true,
    )
  end
end


ANECDOTAL_INFORMATION.each do |pasta_sym, sauce_sym, anecdote|
  #puts pasta
  p = Pasta.find_by_name(pasta_sym.to_s)
  s = Sauce.find_by_name(sauce_sym.to_s)
  #puts p, s
  begin
    ps = PastaSauce.where(
      sauce_id: s.id,
      pasta_id: p.id,
    ).first
    ps.notes = "💭 #{anecdote}" # 'cambiata da Riccardo venerdi sera'
    puts "💭 Succesfully saved anecdote for #{ps}" if ps.save
  # rescue
  #   puts "[ANECDOTAL_INFORMATION] Some error here: #{$!}"
  end
end

BEST_WITH.each do |pasta_sym, sauce_sym|
  p = Pasta.find_by_name(pasta_sym.to_s)
  s = Sauce.find_by_name(sauce_sym.to_s)
  s.pasta = p
  s.save
end

# Sample events. what I think its in the name :)
Event.new(name: 'Why the hell did I add events to a Pasta app?!?').save

# Sample users
User.create(:name => 'ste' , :email => 'ste@example.com' , :likes => 'muller_thurgau', :dislikes => '@cheese' )
User.create(:name => 'ric' , :email => 'ric@example.com' , :likes => 'chocolate, salmon', :dislikes => '@vegetable' )

puts "👍 All done 2023"
