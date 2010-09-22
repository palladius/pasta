class PastaHints < Hobo::ViewHints

  model_name "Tipo di Pasta"
  field_names :active => "Dice se è attivo", :name => "Tipo di pasta"
  field_help :active => "ACTIVE: Enter what you want in this field"
  # children :primary_collection1, :aside_collection1, :aside_collection2
end
