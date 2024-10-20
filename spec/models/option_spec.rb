require 'rails_helper'

RSpec.describe Option, type: :model do
  let(:option) { create(:option) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(option).to be_valid
    end

    it 'is not valid without option_text' do
      option.option_text = nil
      expect(option).not_to be_valid
    end

    it 'is not valid without a question' do
      option.question = nil
      expect(option).not_to be_valid
    end

    it 'is not valid without is_correct being a boolean' do
      option.is_correct = nil
      expect(option).not_to be_valid
    end
  end

  # Associations
  describe 'associations' do
    it 'belongs to a question' do
      expect(option.question).to be_a(Question)
    end
  end
end
