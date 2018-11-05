class Movie < Product
  attr_accessor :producer, :year

  def initialize(params)
    super
    @producer = params[:producer]
    @age = params[:year]
  end

  def to_s
    #Фильм «Леон», 1994, реж. Люк Бессон, 990 руб. (осталось 5)
    "Фильм \"#{@title}\", #{@year}, реж. #{@producer}, #{super}"
  end

  def self.from_file(path)
    content = File.readlines(path, encoding: "UTF-8").map(&:chomp)

    self.new(
      title: content[0],
      producer: content[1],
      year: content[2].to_i,
      price: content[3].to_i,
      quantity: content[4].to_i
      )

  end
end
