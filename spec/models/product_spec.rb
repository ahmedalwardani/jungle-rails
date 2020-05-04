require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    test_category = Category.new(name: 'test_category')
    subject do
      described_class.new(
        name: 'test_name',
        price_cents: 20,
        quantity: 20,
        category: test_category
      )
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is invalid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to include('Name')
    end

    it 'is invalid without price_cents' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to include('Price')
    end

    it 'is invalid without quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to include('Quantity')
    end

    it 'is invalid without category' do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to include('Category')
    end
  end
end

# RSpec.describe Auction, type: :model do
#   let(:seller) { User.new(email: 'jane@doe.com', password: 'pw1234') }
#   subject do
#     described_class.new(
#       title: 'Anything',
#       description: 'Lorem ipsum',
#       start_date: DateTime.now,
#       end_date: DateTime.now + 1.week,
#       user_id: 1
#     )
#   end

#   it 'is valid with valid attributes' do
#     expect(subject).to be_valid
#   end
