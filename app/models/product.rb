class Product < ApplicationRecord

  def self.search(search_term)
    Product.where("name LIKE ?", "%#{search_term}%")
  end

  def index
  if params[:q]
    search_term = params[:q]
    @products = Product.search(search_term)
  else
    @products = Product.all
  end
end

end
