if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__
  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/disc'
require_relative 'lib/product_collection'

cart = []
sum = 0
collection = ProductCollection.from_dir

loop do
  puts "Что хотите купить:"
  puts
  collection.to_a.each_with_index do |val, index|
    puts "#{index + 1}. #{val}"
  end
  puts "0. Выход"

  choice = STDIN.gets.to_i
  case
  when choice <= collection.to_a.size && choice > 0
    choice -= 1
    item = collection.to_a[choice]
    unless item.quantity == 0
      cart << item
      item.quantity -= 1
      sum += item.price
      puts
      print "Вы выбрали: "
      puts item
      puts
      print "Всего товаров на сумму: "
      puts "#{sum} руб."
      puts
    else
      puts "товар закончился."
    end
  when choice == 0
    puts
    puts "Вы купили:"

    cart.uniq.each do |item|
      puts "#{item} X #{cart.count(item)}"
    end

    puts
    puts "С Вас — #{sum} руб. Спасибо за покупки!"
    exit
  else
    puts "Не верный ввод."
  end
end
