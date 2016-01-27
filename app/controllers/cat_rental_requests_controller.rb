class CatRentalRequestsController < ApplicationController
  # def index
  #   @cats = CatRentalRequest.all
  #   render :index
  # end

  # def show
  #   @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
  #   render :show
  # end

  def new
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_params)
    if @cat_rental_request.save
      redirect_to cat_url(@cat_rental_request.cat_id)
    else
      raise "HELL"
    end
  end

  # def edit
  #   @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
  #   render :edit
  # end

  # def update
  #   @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
  #   @cat_rental_request.update_attributes!(cat_rental_params)
  #   redirect_to cat_url(@cat_rental_request)
  # end

  private

  def cat_rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end

end
