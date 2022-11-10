require 'rails_helper'

RSpec.describe 'Amusement Park Show Page' do 
    before do 
        @park = AmusementPark.create(name: 'FunPark', admission_cost: 4)
        @ride1 = Ride.create(name: 'Twirler', thrill_rating: 5, open: true, amusement_park: @park)
        @ride2 = Ride.create(name: 'Curler', thrill_rating: 3, open: true, amusement_park: @park)
        @ride3 = Ride.create(name: 'Hurler', thrill_rating: 7, open: true, amusement_park: @park)
        @mechanic1 = Mechanic.create(name: 'Joe Schmo', years_experience: 10)
        @mechanic2 = Mechanic.create(name: 'Rob Lowe', years_experience: 5)
        @mechanic3 = Mechanic.create(name: 'Rus Crowe', years_experience: 15)

        RideMechanic.create(mechanic: @mechanic1, ride: @ride1)
        RideMechanic.create(mechanic: @mechanic2, ride: @ride1)
        
        RideMechanic.create(mechanic: @mechanic1, ride: @ride2)
        
        RideMechanic.create(mechanic: @mechanic1, ride: @ride3)
        RideMechanic.create(mechanic: @mechanic3, ride: @ride3)

        visit "/amusement_parks/#{@park.id}"
    end 

    describe 'display' do 
        it 'name and cost of admission' do 
            expect(page).to have_content @park.name 
            expect(page).to have_content "Cost of Admission: $#{@park.admission_cost}"
        end 

        it '(unique)list of mechanics working on rides' do 
            expect(page).to have_content "Mechanics working on a ride:"
            expect(page).to have_content @mechanic1.name
            expect(page).to have_content @mechanic2.name
        end 

        it 'list of all park rides' do 
            within "#park_rides" do 
                expect(page).to have_content(@ride1.name)
                expect(page).to have_content(@ride2.name)
                expect(page).to have_content(@ride3.name)
            end
        end

        it 'average experience of mechanics working on a ride' do 
            within "#park_rides" do 
                expect(page).to have_content "#{@ride1.name} - Average Mechanic Experience: 7.5"
                expect(page).to have_content "#{@ride2.name} - Average Mechanic Experience: 10"
                expect(page).to have_content "#{@ride3.name} - Average Mechanic Experience: 12.5"
            end
        end 

        it 'lists all park rides in order of the rides average experience of mechanics' do 
            within "#park_rides" do 
                expect(@ride3.name).to appear_before(@ride2.name)
                expect(@ride2.name).to appear_before(@ride1.name)
            end
        end
    end
end 