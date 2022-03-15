require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    describe 'Product' do
      it 'saves a new product if all four fields are valid' do
        @category = Category.new(name:"clothes")
        @product = Product.new(name: 'Dress', price_cents: 5000, quantity:5, category_id:@category.id)
        @product.save

        expect(@product.name).to eq('Dress')
        expect(@product.price_cents).to eq(5000)
        expect(@product.quantity).to eq(5)
        expect(@product.category_id).to eq(@category.id)
      end
    end

    describe 'Product' do
      it 'does not save a new product if name is nil' do
        @category = Category.new(name:"clothes")
        @product = Product.new(name: nil, price_cents: 5000, quantity:5, category_id:@category.id)
        @product.save

        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    describe 'Product' do
      it 'does not save a new product if price_cents is nil' do
        @category = Category.new(name:"clothes")
        @product = Product.new(name: 'Dress', price_cents: nil, quantity:5, category_id:@category.id)
        @product.save

        expect(@product.errors.full_messages).to include("Price is not a number")
      end
    end

    describe 'Product' do
      it 'does not save a new product if quantity is nil' do
        @category = Category.new(name:"clothes")
        @product = Product.new(name: "Dress", price_cents: 5000, quantity:nil, category_id:@category.id)
        @product.save

        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    describe 'Product' do
      it 'does not save a new product if category id is nil' do
        @category = Category.new(name:"clothes")
        @product = Product.new(name: 'Dress', price_cents: 5000, quantity:5, category_id: nil)
        @product.save

        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end

  end
end