require 'rails_helper'

RSpec.describe Mechanic do 
    describe 'relationships' do 
        it { should have_many :ride_mechanics }
        it { should have_many(:rides).through(:ride_mechanics) }
    end 

    describe 'validations' do 
        it { should validate_presence_of :name }
        it { should validate_presence_of :years_experience }
    end 
end 

