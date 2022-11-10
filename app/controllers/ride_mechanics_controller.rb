class RideMechanicsController < ApplicationController 
    def create 
        RideMechanic.create(mechanic_id: params[:id], ride_id: params[:ride_id])
        redirect_to "/mechanics/#{params[:id]}"
    end
end