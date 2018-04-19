class HostsController < ApplicationController
  def index
    @user = current_user
    # @houses = House.order('id asc').limit 20
  end

  def new
    @host = Host.new
    @user = current_user
    # @house_types = House_type.all
  end

  def create
    @host = Host.new(create_params)
  end

  private
  def create_params
    params.require(:host).permit(:caregory, :house_type, :size_of_building, :room_type)
  end
end
