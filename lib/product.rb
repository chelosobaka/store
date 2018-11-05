class Product
  attr_accessor :price, :quantity, :title

  def initialize(params)
    @title = params[:title]
    @price = params[:price]
    @quantity = params[:quantity]
  end

  def to_s
    "#{@price} руб. (осталось #{quantity})"
  end

  def self.from_file(path)
    raise NotImplementedError
  end
end
