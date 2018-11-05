class Disc < Product
  attr_accessor :author, :genre

  def initialize(params)
    super
    @author = params[:author]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    #Альбом Judas Priest — «Painkiller», Heavy Metal, 1990, 990 руб. (осталось 2)
    "Альбом #{@author} - \"#{@title}\", #{@genre}, #{@year}, #{super}"
  end

  def self.from_file(path)
    content = File.readlines(path, encoding: "UTF-8").map(&:chomp)

    self.new(
      title: content[0],
      author: content[1],
      genre: content[2],
      year: content[3].to_i,
      price: content[4].to_i,
      quantity: content[5].to_i
      )

  end
end
