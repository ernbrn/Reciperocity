json.recipes @recipes do |recipe|
  json.partial! "recipe", recipe: recipe
end

