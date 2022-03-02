User.create!([
  {name: "Ace", email: "ace@gmail.com", password: "password"},
  {name: "Cheddar", email: "cheddar@gmail.com", password: "password"},
  {name: "Dani", email: "dani@gmail.com", password: "password"}
])

Recipe.create!([
  {title: "Raw Eggs", ingredients: "Chicken", directions: "Squeeze the chicken", prep_time: 1, image_url: "http://swansonhealthcenter.com/wp-content/uploads/2011/07/Egg.jpg", user_id: 1},
  {title: "Empty Sandwich", ingredients: "Two slices of bread", directions: "Place slices of bread next to each other.", prep_time: 72, image_url: "http://www.phoenixisstrategic.com/wp-content/uploads/2013/05/blog-empty-sandwich.jpg", user_id: 1},
  {title: "Licorice", ingredients: "Licorice", directions: "Buy licorice from store.", prep_time: 120, image_url: "http://cdn2.bigcommerce.com/server6200/aa739/product_images/uploaded_images/red-licorice.png?t=1398725710", user_id: 1},
  {title: "Mud Pie", ingredients: "Flour, water, mud.", directions: "Mix flour and water, add mud, bake at 350 degrees for 1 hour.", prep_time: 84, image_url: "http://cdn-image.myrecipes.com/sites/default/files/styles/300x300/public/image/recipes/sl/05/12/mocha-mud-pie-sl-257949-x.jpg?itok=_ChocANl", user_id: 1},
  {title: "Corn on the cob", ingredients: "Corn, cob", directions: "Place corn on the cob, grill for 20 minutes, enjoy!", prep_time: 22, image_url: "http://www.scientificamerican.com/sciam/cache/file/59C0122F-509C-4FEE-99A67FC20C50CEF1.jpg", user_id: 1},
  {title: "Pizza", ingredients: "Flour, water, pepperoni, cheese", directions: "Mix flour and water, add cheese and pepperoni, shape as a heart, bake in oven on self-clean mode.", prep_time: 455, image_url: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-homemade-pizza-horizontal-1542312378.png?crop=1.00xw:1.00xh;0,0&resize=480:*", user_id: 1},
  {title: "Tofu Bibimbap!!!", ingredients: "Lots of fresh vegetables, rice, tofu, egg", directions: "Mix all together with spicy sauce", prep_time: 10, image_url: "https://www.halfbakedharvest.com/wp-content/uploads/2018/01/Superfood-Bibimbap-with-Crispy-Tofu-1-500x500.jpg", user_id: 2},
  {title: "Overnight Oats", ingredients: "Oats, milk, flavors", directions: "Put milk and oats together and fridge overnight", prep_time: 5, image_url: "https://static.toiimg.com/thumb/60087200.cms?width=1200&height=900", user_id: 2}
])

