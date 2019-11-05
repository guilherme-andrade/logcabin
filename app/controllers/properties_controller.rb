class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = policy_scope(Property)

    authorize @properties
    render layout: 'simple'
  end

  def show
    authorize @property
  end

  def new
    @property = Property.new
    authorize @property
  end

  def edit
    if current_user != @property.user
      redirect_to @property
    end
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user

    authorize @property

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
    authorize @property
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
