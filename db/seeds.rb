Image.create!([
  {url: "http://www.jaydelovell.com/wp-content/uploads/2015/01/ask-me-about-my-banana.jpg", product_id: 1},
  {url: "http://www.jacksonadvocateonline.com/wp-content/uploads/2011/08/peach_1.jpg", product_id: 2},
  {url: "http://www.vegkitchen.com/wp-content/uploads/2013/04/Apples-in-a-basket.jpg", product_id: 3}
])
Product.create!([
  {name: "banana", price: "0.35", description: "Yellow fruit, high in potassium, don't eat the peel.", instock: nil, supplier_id: 1},
  {name: "peach", price: "1.99", description: "Fuzzy edible exterior, hard pit inside, seasonal avaialability", instock: nil, supplier_id: 1},
  {name: "apple", price: "0.51", description: "Apples are crispy, sweet fruits with a seeded core. They come in all shades, from yellow to green to deep red. Each different type of apple has its own unique flavor profile. Try lots and decide for yourself which you like the best.", instock: false, supplier_id: 1}
])
Supplier.create!([
  {name: "Cupertino Fruit Company", email: "cupertinofruit@gmail.com", phone: "(987) 654-3210"}
])
