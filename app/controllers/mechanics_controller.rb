class MechanicsController < ApplicationController 
    def show 
        @mechanic = Mechanic.find(params[:id])
    end 
end