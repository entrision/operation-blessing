class Api::V1::PhotosController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    if params[:date]
      begin
        @photos = Photo.where(for_date: Date.parse(params[:date])).sort_by_date
      rescue ArgumentError => e
        @photos = Photo.sort_by_date
      end
    else
      @photos = Photo.sort_by_date
    end
    render json: @photos.as_json
  end

  def show
    @photo = Photo.find(params[:id])
    render json: @photo
  end

  def create
    @photo = Photos.new(photos_params)
    if @photo.save
      render json: { success: true }, status: 201
    else
      render json: { success: false, errors: @photos.errors.full_messages }, status: 406
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:id, :url, :location, :for_date, :prayer)
  end

end
