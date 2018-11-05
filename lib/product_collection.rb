class ProductCollection
  PRODUCT_TYPE = {
          books: {dir: 'books', class: Book},
          films: {dir: 'films', class: Movie},
          disc: {dir: 'discs', class: Disc}
         }


  def initialize(products = [])
    @products = products
  end

  def self.from_dir
    products = []

    PRODUCT_TYPE.each do |type, hash|
      dirrectory = hash[:dir]
      class_name = hash[:class]

      Dir["data/#{dirrectory}/*.txt"].each do |file|
        products << class_name.from_file(file)
      end
    end
    self.new(products)
  end

  def to_a
    @products
  end

  def sort!(params)
    case params[:by]
    when :price then @products.sort_by!{|product| product.price}
    when :quantity then @products.sort_by!{|product| product.quantity}
    when :title then @products.sort_by!{|product| product.title}
    end

    @products.reverse! if params[:order] == :asc
    @products
  end

end

