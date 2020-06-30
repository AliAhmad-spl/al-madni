class DataChanged < ActiveRecord::Migration[5.2]
  def change
  	  	OneMenu.create(name:"Mutton")
  	OneMenu.create(name:"Chicken")
  	OneMenu.create(name:"Beef")
  	OneMenu.create(name:"Bar B-Q")
  	OneMenu.create(name:"Breakfast")
  	OneMenu.create(name:"Extra")
  	OneMenu.create(name:"Drinks")
  	OneMenu.create(name:"Extra Dishes")

  	Product.create(name:"کلومٹن کڑاہی دیسی گھی والی", price: 1900, one_menu_id: 1)
  	Product.create(name:"مٹن کراہی", price: 1700, one_menu_id: 1)
  	Product.create(name:"پاؤمٹن کڑاہی دیسی گھی والی", price: 475, one_menu_id: 1)
  	Product.create(name:"پاؤ مٹن کڑاہی", price: 425, one_menu_id: 1)
  	Product.create(name:"پاؤ مٹن اچاری ", price: 450, one_menu_id: 1)
	Product.create(name:"مٹن قورمہ فل", price: 400, one_menu_id: 1)
  	Product.create(name:"مٹن قورمہ ہاف ", price: 200, one_menu_id: 1)
  	Product.create(name:"پلیٹ مٹن قیمہ", price: 300, one_menu_id: 1)

  	Product.create(name:"کلو چکن کڑاہی دیسی گھی والی", price: 1000, one_menu_id: 2)
  	Product.create(name:"پاؤ چکن کڑاہی دیسی گھی والی", price: 250, one_menu_id: 2)
  	Product.create(name:"کلو دیسی چکن کڑاہی", price: 1700, one_menu_id: 2)
  	Product.create(name:"پاؤ دیسی چکن کڑاہی", price: 425, one_menu_id: 2)
  	Product.create(name:"کلو چکن اچاری", price: 900, one_menu_id: 2)
  	Product.create(name:"چکن قورمہ ہاف", price: 125, one_menu_id: 2)
  	Product.create(name:"دیسی مرغی دیسی گھی", price: 1900, one_menu_id: 2)


  	Product.create(name:"کلو بیف کڑاہی", price: 1100, one_menu_id: 3)
  	Product.create(name:"پاؤ بیف کڑاہی", price: 280, one_menu_id: 3)
  	Product.create(name:"کلو بیف اچاری", price: 1200, one_menu_id: 3)
  	Product.create(name:"پاؤ بیف اچاری", price: 300, one_menu_id: 3)
  	Product.create(name:"پاؤ بیف کڑاہی دیسی گھی والی", price: 325, one_menu_id: 3)


  	Product.create(name:"لیگ پیس", price: 140, one_menu_id: 4)
  	Product.create(name:"بیف کباب", price: 60, one_menu_id: 4)
  	Product.create(name:"چکن تک", price: 60, one_menu_id: 4)
  	Product.create(name:"چکن کباب", price: 60, one_menu_id: 4)
  	Product.create(name:"ملائی بوٹی", price: 110, one_menu_id: 4)

  	Product.create(name:"چھوٹے پائے", price: 250, one_menu_id: 5)
  	Product.create(name:"بڑےپائے", price: 220, one_menu_id: 5)
  	Product.create(name:"چنےچاول", price: 100, one_menu_id: 5)
  	Product.create(name:"پراٹھہ", price: 40, one_menu_id: 5)
  	Product.create(name:"لسی", price: 80, one_menu_id: 5)
  	Product.create(name:"شاہی دال", price: 120, one_menu_id: 5)
  	Product.create(name:"سپیشل چائے", price: 50, one_menu_id: 5)
  	Product.create(name:"چائے کا کپ", price: 40, one_menu_id: 5)
  	Product.create(name:"چنئے چاول", price: 100, one_menu_id: 5)

  	Product.create(name:"رائتی", price: 40, one_menu_id: 6)
  	Product.create(name:"سلاد", price: 40, one_menu_id: 6)
  	Product.create(name:"روٹی فی", price: 20, one_menu_id: 6)
  	Product.create(name:"کلو رشین سلاد", price: 600, one_menu_id: 6)
  	Product.create(name:"پاؤ رشین سلاد", price: 150, one_menu_id: 6)
  	Product.create(name:"اچار", price: 10, one_menu_id: 6)
  	Product.create(name:"پیکنگ", price: 10, one_menu_id: 6)
  	Product.create(name:"بڑا فروٹ کیک", price: 100, one_menu_id: 6)
  	Product.create(name:"کپ کیک", price: 15, one_menu_id: 6)
  	Product.create(name:"بن", price: 25, one_menu_id: 6)
  	Product.create(name:"ڈسپوزیبل پلیٹ", price: 5, one_menu_id: 6)
  	Product.create(name:"ڈسپوزیبل پلیٹ بڑی", price: 10, one_menu_id: 6)


  	Product.create(name:"ڈیڑھ لٹربوتل", price: 100, one_menu_id: 7)
  	Product.create(name:"لٹربوتل", price: 70, one_menu_id: 7)
  	Product.create(name:"ہاف لٹر بوتل", price: 50, one_menu_id: 7)
  	Product.create(name:"سٹنگ ہاف لٹر", price: 60, one_menu_id: 7)
  	Product.create(name:"منرل واٹربڑی", price: 60, one_menu_id: 7)
  	Product.create(name:"منرل واٹر چھوٹی", price: 30, one_menu_id: 7)
  	Product.create(name:"ریگولر بوتل", price: 30, one_menu_id: 7)



  	Product.create(name:"کلو چکن بریانی", price: 300, one_menu_id: 8)
  	Product.create(name:"پاؤ چکن بریانی", price: 75, one_menu_id: 8)
  	Product.create(name:"پلیٹ دال ماش", price: 80, one_menu_id: 8)
  	Product.create(name:"پلیٹ سبزی", price: 70, one_menu_id: 8)
  	Product.create(name:"کھیر", price: 60, one_menu_id: 8)
  	Product.create(name:"پلیٹ دال ماش دیسی گھی والی", price: 150, one_menu_id: 8)
  	Product.create(name:"پلیٹ ملائی", price: 200, one_menu_id: 8)
  	Product.create(name:"کلودودھ", price: 110, one_menu_id: 8)
  	Product.create(name:"پاؤ دودھ", price: 28, one_menu_id: 8)
  end
end
