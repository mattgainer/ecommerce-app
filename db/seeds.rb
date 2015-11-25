User.create!([])
Image.create!([
  {url: "http://www.jaydelovell.com/wp-content/uploads/2015/01/ask-me-about-my-banana.jpg", product_id: 1},
  {url: "http://www.jacksonadvocateonline.com/wp-content/uploads/2011/08/peach_1.jpg", product_id: 2},
  {url: "http://www.vegkitchen.com/wp-content/uploads/2013/04/Apples-in-a-basket.jpg", product_id: 3},
  {url: "https://www.holdthecarbs.com/community/wp-content/uploads/2015/05/uses-of-fruits.jpg", product_id: 10},
  {url: "http://www.gifttree.com/images/super/42j_Colossal-Fruit-Basket.jpg", product_id: 10}
])
Order.create!([
  {user_id: 1, product_id: 10, quantity: 0, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, product_id: 10, quantity: 0, subtotal: "0.0", tax: "0.0", total: "0.0"},
  {user_id: 1, product_id: 10, quantity: 1, subtotal: "1.5", tax: "0.14", total: "1.64"},
  {user_id: 6, product_id: 10, quantity: 1, subtotal: "1.5", tax: "0.14", total: "1.64"}
])
Product.create!([
  {name: "banana", price: "0.35", description: "Yellow fruit, high in potassium, don't eat the peel.", instock: nil, supplier_id: 1, user_id: 1},
  {name: "peach", price: "1.99", description: "Fuzzy edible exterior, hard pit inside, seasonal avaialability", instock: nil, supplier_id: 1, user_id: 1},
  {name: "apple", price: "0.51", description: "Apples are crispy, sweet fruits with a seeded core. They come in all shades, from yellow to green to deep red. Each different type of apple has its own unique flavor profile. Try lots and decide for yourself which you like the best.", instock: false, supplier_id: 1, user_id: 1},
  {name: "assortment of fruit", price: "1.5", description: "This is a basket of fruits.", instock: true, supplier_id: 1, user_id: 1}
])
Role.create!([
  {name: "admin"},
  {name: "buyer"}
])
Supplier.create!([
  {name: "Cupertino Fruit Company", email: "cupertinofruit@gmail.com", phone: "(987) 654-3210"}
])
