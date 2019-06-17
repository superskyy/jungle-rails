require "rails_helper"

RSpec.describe Product, type: :model do
  describe 'Validations' do

   #  it 'should have a name' do
   #  	@category = Category.new name: "Computers"
   #  	@category.save!
   #  	expect(@category.name).to be_present
    	
  	# end

  	it 'should have a name' do
  		@product = Product.new name: "Macbook"
			# @product.save!

			expect(@product.name).to be_present
    	
  	end

  	it 'should have a price' do
  		@product = Product.new price: 10

			expect(@product.price).to be_present
    	
  	end

  	it 'should have a quantity' do
  		@product = Product.new quantity: 50

			expect(@product.quantity).to be_present
  	end

  	it 'should have a category' do
  		@category = Category.new name: "Computers"
  		@product = Product.new category: @category

			expect(@product.category).to be_present
  	end
  end
end