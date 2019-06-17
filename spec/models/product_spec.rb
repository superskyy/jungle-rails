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
			@product.save
			@product.errors.full_messages

			expect(@product.name).to be_present
    	
  	end

  	it 'should have a price' do
  		@product = Product.new price: 10
  		@product.save
  		@product.errors.full_messages

			expect(@product.price).to be_present
    	
  	end

  	it 'should have a quantity' do
  		@product = Product.new quantity: 50
  		@product.save
  		@product.errors.full_messages

			expect(@product.quantity).to be_present
  	end

  	it 'should have a category' do
  		@category = Category.new name: "Computers"
  		@category.save
  		@category.errors.full_messages
  		@product = Product.new category: @category
  		@product.save
  		@product.errors.full_messages

			expect(@product.category).to be_present
  	end
  end
end