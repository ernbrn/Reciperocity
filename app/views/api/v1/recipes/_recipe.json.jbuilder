json.name recipe.dish_name
json.(recipe, :ingredient_list, :prep_time, :cook_time, :instructions, :yield, :picture)
json.created_by recipe.user.name if recipe.user
