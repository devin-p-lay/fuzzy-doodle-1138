require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'validations' do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :admission_cost }
  end
end