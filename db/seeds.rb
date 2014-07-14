User.create([
  {name: "Erin", email: "flapflap@yomama.com", encrypted_password: "$2a$10$JQ9WjxG2BTkDhmYQUJ5Ht.WjJCF9h2otupfCcNhgUHxFtFi/iX8sq", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: "544b0e796f591fe169dd82fda8efe829ea5b9713a9f7989cf8faeaf9d925e7a5", confirmed_at: nil, confirmation_sent_at: "2014-07-09 04:45:31"},
  {name: "Hen", email: "dogg@mydog.com", encrypted_password: "$2a$10$TMSpKdWPOcB.kmlzX3GoDeAW2hvBy24vDyWO54.IsfWYBCI5aGKKu", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: "08ec4b920b0047a3c322ca44519d8e6dd5d26c49f4450cd4050058956a7c44d4", confirmed_at: nil, confirmation_sent_at: "2014-07-09 16:57:58"},
  {name: "Erin Brown", email: "emberbrown@gmail.com", encrypted_password: "$2a$10$Nz1wZNgASMdDtQ2B.QyBV.25Af3kr10jdQyCp8bJyJXAvUaMGG.S2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2014-07-09 19:40:27", last_sign_in_at: "2014-07-09 17:49:28", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: "2014-07-08 18:19:17", confirmation_sent_at: "2014-07-08 18:19:11"}
])
Recipe.create!([
  {dish_name: "Tasty beer", instructions: "drink it ", yield: "1 beer", ingredient_list: "peaces", prep_time: "no time", cook_time: "lotsa time", picture: "beer.jpeg", user_id: nil},
  {dish_name: "Pad Thai", instructions: "Cook with tofu", yield: "too much", ingredient_list: "Rice noodles", prep_time: "no time", cook_time: "lots of time", picture: "pad-thai4.jpg", user_id: 1},
  {dish_name: "Rosemary Garlic Popcorn", instructions: "", yield: "", ingredient_list: "popcorn \r\nbutter", prep_time: "", cook_time: "", picture: "pop.jpg", user_id: 1},
  {dish_name: "Margherita Pizza", instructions: "", yield: "", ingredient_list: "Motz\r\nBasil\r\nSauce", prep_time: "", cook_time: "", picture: "pizza.jpeg", user_id: 1},
  {dish_name: "Tasty Thai", instructions: "Simmer to perfection", yield: "not enouch", ingredient_list: "Yellow Curry\r\nRice Noodles\r\nCoconut Milk\r\nLemongrass", prep_time: "an hour", cook_time: "an hour", picture: "yum.jpg", user_id: nil},
  {dish_name: "General Tso Tofu", instructions: "Marinate to perfection", yield: "2 servings", ingredient_list: "Tofu\r\nGeneral Tso Sauce", prep_time: "20 min", cook_time: "10 min", picture: "tofu.jpeg", user_id: 1},
  {dish_name: "Salsa", instructions: "Chop up all ingredients", yield: "6 servings", ingredient_list: "Tomatoes, cilantro, onions", prep_time: "20min", cook_time: "None", picture: "images.jpeg", user_id: 1},
  {dish_name: "Chicken Tikki Masala", instructions: "Simmer until done", yield: "3 servings", ingredient_list: "Chicken, cream, tomato, naan, aljd falks jdlf  kjasl dk fjal ksjdf;la kjs d;lf jas;ldkf ja;l skjdf;lak sjdf lak jsdflkjas ;dlkfja ;sld kjf  alksdjflaj f;aljsd f;lkajs dfl;kajs df as;ldfja faslkjdf aslkdjf aslkjf aslkjd alke oijf woijf Chicken, cream, tomato, naan, aljd falks jdlf kjasl dk fjal ksjdf;la kjs d;lf jas;ldkf ja;l skjdf;lak sjdf lak jsdflkjas ;dlkfja ;sld kjf alksdjflaj f;aljsd f;lkajs dfl;kajs df as;ldfja faslkjdf aslkdjf aslkjf aslkjd alke oijf woijf", prep_time: "30min", cook_time: "40min", picture: "tikki.jpg", user_id: 1},
  {dish_name: "Strawberry salsa", instructions: "", yield: "not enough", ingredient_list: "lala al alkfja sdf alskdj oijf lkdj dlkjfie i lf a lkaf eoek af adfo lala al alkfja sdf alskdj oijf lkdj dlkjfie i lf a lkaf eoek af adfo lala al alkfja sdf alskdj oijf lkdj dlkjfie i lf a lkaf eoek af adfo lala al alkfja sdf alskdj oijf lkdj dlkjfie i lf a lkaf eoek af adfo lala al alkfja sdf alskdj oijf lkdj dlkjfie i lf a lkaf eoek af adfo lala al alkfja sdf alskdj oijf lkdj dlkjfie i lf a lkaf eoek af adfo lala al alkfja sdf alskdj oijf lkdj dlkjfie i lf a lkaf eoek af adfo ", prep_time: "", cook_time: "", picture: "strawberrysalsa.jpeg", user_id: 1},
  {dish_name: "Black bean salsa", instructions: "blahblahblah", yield: "4 servings", ingredient_list: "blahblahblah", prep_time: "30min", cook_time: "20 min", picture: "corn-and-black-bean-salsa_DSC8842.jpg", user_id: 1}
])
ActsAsTaggableOn::Tagging.create!([
  {tag_id: 3, taggable_id: 11, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 4, taggable_id: 11, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 5, taggable_id: 11, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 6, taggable_id: 12, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 7, taggable_id: 12, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 9, taggable_id: 16, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 10, taggable_id: 16, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 11, taggable_id: 17, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 9, taggable_id: 17, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 12, taggable_id: 17, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 6, taggable_id: 18, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 13, taggable_id: 18, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 14, taggable_id: 22, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 3, taggable_id: 22, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 13, taggable_id: 23, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 15, taggable_id: 23, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 16, taggable_id: 24, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 17, taggable_id: 24, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"},
  {tag_id: 18, taggable_id: 26, taggable_type: "Recipe", tagger_id: nil, tagger_type: nil, context: "tags"}
])
ActsAsTaggableOn::Tag.create!([
  {name: "hip", taggings_count: 0},
  {name: "ster", taggings_count: 0},
  {name: "yum", taggings_count: 1},
  {name: "love it", taggings_count: 1},
  {name: "yummy", taggings_count: 1},
  {name: "cool", taggings_count: 0},
  {name: "tomatoes", taggings_count: 1},
  {name: "popcorn", taggings_count: 1},
  {name: "garlic", taggings_count: 2},
  {name: "rosemary", taggings_count: 1},
  {name: "thai", taggings_count: 2},
  {name: "pizza", taggings_count: 1},
  {name: "beer", taggings_count: 2},
  {name: "tofu", taggings_count: 2},
  {name: "chinese", taggings_count: 1},
  {name: "indian", taggings_count: 1},
  {name: "chicken", taggings_count: 1},
  {name: "salsa", taggings_count: 1}
])
