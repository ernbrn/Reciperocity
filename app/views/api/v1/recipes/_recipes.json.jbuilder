json.name recipe.dish_name
json.(recipe, :ingredient_list, :prep_time, :cook_time, :instructions, :yield, :picture, :user)
json.creator recipe.user.try(:name)

