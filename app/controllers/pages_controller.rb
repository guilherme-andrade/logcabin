class PagesController < ApplicationController
  def home; end

  def profile
  	@properties = Property.all
  end
end
