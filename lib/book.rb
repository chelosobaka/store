class Book < Product
  attr_accessor :author, :genre

  def initialize(params)
    super
    @author = params[:author]
    @genre = params[:genre]
  end

  def to_s
    #Книга «Идиот», роман, автор — Федор Достоевский, 1500 руб. (осталось 10)
    "Книга \"#{@title}\", #{@genre}, автор - #{@author}, #{super}"
  end

  def self.from_file(path)
    content = File.readlines(path, encoding: "UTF-8").map(&:chomp)

    self.new(
      title: content[0],
      genre: content[1],
      author: content[2],
      price: content[3].to_i,
      quantity: content[4].to_i
      )

  end
end
