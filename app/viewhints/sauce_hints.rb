class SauceHints < Hobo::ViewHints

  model_name "Condimento"
  field_names :name => "Nome del condimento", :active => "Attivo"
  field_help :color => "Colore dominante del sugo in HTML (red,green, white, ..)"
  ###children :primary_collection1, :aside_collection1, :aside_collection2
  ###children :pastas
end
