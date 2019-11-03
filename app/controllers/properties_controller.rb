class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
    render layout: 'simple'
  end

  def show
  end

  def new
    @property = Property.new
  end

  def edit
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to @property, notice: "'#{@property.name}' was successfully created."
    else
      render :new
    end
  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: "'#{@property.name}' was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_url, notice: "'#{@property.name}' was successfully destroyed."
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:address, :name, :photo)
    end
end
