class AddDataToSystem < ActiveRecord::Migration[5.2]
  def change
  	OneMenu.create(name:"BREAKFAST")  	
  	OneMenu.create(name:"EXTRAS")
  	OneMenu.create(name:"CHICKEN")
  	OneMenu.create(name:"MUTTON")
  	OneMenu.create(name:"DRINKS")
    OneMenu.create(name:"EXTRA DISHES")
    OneMenu.create(name:"BAR-B-Q")
    OneMenu.create(name:"BEEF")
  	#juice  	  	  	  	  	
    Product.create(name:"Chotay Paye", price:"250", one_menu_id: 1)
    Product.create(name:"Baday Paye", price:"220", one_menu_id: 1)
    Product.create(name:"Shahi Dall", price:"120", one_menu_id: 1)
    Product.create(name:"Chana Chawal", price:"100", one_menu_id: 1)
    Product.create(name:"Paratha", price:"40", one_menu_id: 1)
    Product.create(name:"Lassi", price:"80", one_menu_id: 1)
    Product.create(name:"Chai Cup", price:"40", one_menu_id: 1)
    Product.create(name:"Special chye", price:"50", one_menu_id: 1)
    Product.create(name:"Chana plate", price:"80", one_menu_id: 1)
  	#ice cream
    Product.create(name:"Raita",price:"40",one_menu_id:2)
    Product.create(name:"Fresh Salad",price:"40",one_menu_id: 2)
    Product.create(name:"Fruit cake Small",price:"80",one_menu_id:2)
    Product.create(name:"Roti paratha",price:"20",one_menu_id:2)
  end
end
