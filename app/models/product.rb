class Product < ApplicationRecord
  has_many :comments
  has_many :orders

    validates :name, presence: true

    def self.search(search_term)
      Product.where("name LIKE ?", "%#{search_term}%")
      if Rails.env.development?
        Product.where("name LIKE ? OR description LIKE ? OR color LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
      else
        Product.where("name ilike ? OR description ilike ? OR color ilike ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
      end
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

# SQL Databases:
# LIKE is sqlites3
# ilike is postgres
