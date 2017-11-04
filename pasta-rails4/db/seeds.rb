# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

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

SEED_VER = '1.2'
DESTROY_ALL_BEFORE_SEEDING = true

BAD_CONDIMENTS = [
  %w{spaghetti      bolognese },
  %w{pappardelle    salmone carbonara },
#  %w{tagliatelle    pesto },
]
GOOD_CONDIMENTS = [
  %w{ agnolotti      burro_salvia bolognese brodo }, # http://it.wikipedia.org/wiki/Agnolotti_piemontesi
  %w{ bucatini       amatriciana pomodoro },
#  %w {bigoli         luganega },
#  %w {conchiglie     pomodoro bolognese piselli },
  %w{ fusilli        bolognese pesto radicchio },
  %w{ garganelli     boscaiola nero_di_seppia bolognese quattro_formaggi },
  %w{ gnocchi        sorrentina dun_laoghaire quattro_formaggi },
  %w{ gramigna       salsiccia bolognese },
  %w{ orecchiette    pesto nero_di_seppia piselli },
  %w{ paccheri       bolognese }, # http://it.wikipedia.org/wiki/Paccheri
  %w{ pappardelle    bolognese cinghiale boscaiola funghi } ,  # http://it.wikipedia.org/wiki/Pappardelle
  %w{ penne          aglio_olio amatriciana bolognese puttanesca radicchio quattro_formaggi piselli } ,
  %w{ spaghetti      aglio_olio amatriciana bolognese carbonara nero_di_seppia pesto pomodoro puttanesca scoglio tonno },
  %w{ strozzapreti   canocchie cinghiale pesto ragu },
  %w{ tagliatelle    bolognese funghi gamberetti_zucchine nero_di_seppia panna_funghi prosciutto tartufo }, # http://it.wikipedia.org/wiki/Tagliatelle
  %w{ tagliolini     scoglio gamberetti_zucchine nero_di_seppia panna_funghi },
  %w{ tortellini     brodo panna },
  %w{ tortelloni     pomodoro burro_salvia },
 ]
 
INGREDIENTS = {
  :eggs         => 'protein,animal',

  :bacon        => "meat, fat",
  :pancetta     => "meat, fat",
  :chicken      => 'meat, illegal_with_pasta',
  :minced_beef  => 'meat',
  :luganega     => 'meat',
  :salsiccia    => 'meat, fat',
  
  :mozzarella   => 'cheese',
  :cheddar      => 'cheese',
  :cream        => 'milk', 

  :oil          => 'fat, condiment', 

  :pesto        => 'sauce' ,
  :garlic       => 'spice',
  :red_pepper   => 'spice',
  :black_pepper => 'spice',
  :onions       => 'spice, vegetable', 
  :sage         => 'spice',


  :cucumbers    => 'vegetable',
  :mushrooms    => 'vegetable',
  :celery       => 'vegetable', 
  :carrots      => 'vegetable', 
  :tomato_sauce => 'vegetable',
  :corn         => 'vegetable, illegal_with_pasta',
  
  :fresh_tuna   => 'fish',
  :tin_tuna     => 'fish',
  :octopus      => 'fish',
  :scampi       => 'fish',
  :salmon       => 'fish,healthy',
  :shrimps      => 'fish',
}
 
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
    :description => "Created via seed v. #{SEED_VER}"
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
INGREDIENTS.each{|ingredient, tags|
  puts "  + Inserting '#{ingredient}' --> '#{tags}'"
  Ingredient.seed(ingredient.to_s, tags, "Created via seed v. #{SEED_VER}" )
}


# Sample users

User.create( :name => 'ste' , :email_address => 'ste@example.com' , :likes => 'muller_thurgau', :dislikes => '@cheese' )
User.create( :name => 'ric' , :email_address => 'ric@example.com' , :likes => 'chocolate, salmon', :dislikes => '@vegetable' )
