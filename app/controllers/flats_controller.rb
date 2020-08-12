class FlatsController < ApplicationController
  def index
    flats = Flat.all
  end

  def show
    flat = Flat.find(params[:id])
  end

  def new
    flat = Flat.new
  end

  def create
    flat = Flat.new(flat_params)
    if flat.save
      redirect_to flat
    else
      render :new
    end
  end

  def destroy
    flat = Flat.find(params[:id])
    flat.destroy

    # no need for app/views/flats/destroy.html.erb
    redirect_to flats_path
  end


  def edit
    flat = Flat.find(params[:id])
  end

  def update
    flat = Flat.find(params[:id])
    flat.update(flat_params)

    # no need for app/views/flats/update.html.erb
    redirect_to flat_path(flat)
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :phone_number, :category)
  end
end

