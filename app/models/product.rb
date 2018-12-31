class Product < ApplicationRecord
  has_many :comments
  has_many :orders

    validates :name, presence: true

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

  def highest_rating_comment
    comments.rating_desc.first
  end
  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end


end
