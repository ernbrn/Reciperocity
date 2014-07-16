json.recipes @recipes do |recipe|
  json.partial! "recipes", recipe: recipe
end

