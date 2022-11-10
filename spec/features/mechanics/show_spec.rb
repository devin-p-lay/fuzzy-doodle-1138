require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do 
    before do
        @park = AmusementPark.create(name: "FunPark", admission_cost: 2)
        @ride1 = Ride.create(name: 'Twirler', thrill_rating: 3, open: true, amusement_park: @park)
        @ride2 = Ride.create(name: 'Curler', thrill_rating: 1, open: true, amusement_park: @park)
        @ride3 = Ride.create(name: 'Hurler', thrill_rating: 5, open: true, amusement_park: @park)
        @mechanic1 = Mechanic.create(name: 'Joe Schmo', years_experience: 5)
        @mechanic2 = Mechanic.create(name: 'Beaux Roe', years_experience: 2)

        visit mechanic_path(@mechanic1)
    end 

    describe 'when I visit the Mechanic Show Page' do 
        describe 'display' do 
            it 'name, years of experience, names of all rides they are working on' do
                expect(page).to have_content("Mechanic: #{@mechanic1.name}")
                expect(page).to have_content("Years of Experience: #{@mechanic1.years_experience}")
                expect(page).to have_content('Rides currently working on:')
            end

            describe 'form to add a ride to a mechanic' do
                it 'when filled in with existing ride id and submitted, redirected to mechanic show page and see ride' do 
                    fill_in :ride_id, with: "#{@ride1.id}"
                    click_on 'Add Ride'
                    
                    expect(current_path).to eq(mechanic_path(@mechanic1))
                    expect(page).to have_content(@ride1.name)
                end  
            end 
        end
    end
end 