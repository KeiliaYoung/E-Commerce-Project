require 'rails_helper'

describe Order do
  context "when an order is being created" do

    it "is not valid without a total price" do
        expect(Order.new(total: nil)).to_not be_valid
    end

    it "is not valid without a product_id" do
      expect(Order.new(product_id: nil)).to_not be_valid
    end

    it "is not valid without a user_id" do
      expect(Order.new(user_id: nil)).to_not be_valid
    end  
  end
end
