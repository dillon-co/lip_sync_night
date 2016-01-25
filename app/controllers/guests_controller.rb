class GuestsController < ApplicationController

  def index
    @new_guest = Guest.new
    @guests = Guest.all
    @singing_guests = Guest.where("song is NOT NULL and song != ''")
    @helping_guests = Guest.where("item_bringing is NOT NULL and item_bringing != ''")
  end
  
  def create
    guest = Guest.create(guest_params)
    if guest.save
      redirect_to :back
    else
      render :new
    end    
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :song, :item_bringing)
  end  
end
