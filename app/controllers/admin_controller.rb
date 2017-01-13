class AdminController < ApplicationController
  before_action :authenticate_owner!
  before_action :authorize

  def index
    @owners = Owner.all
  end

  def update
    owner = Owner.find(params[:id])
    owner.remove_role owner.roles.first.name # user only has one role
    new_role = params[:role]
    owner.add_role new_role
    redirect_to '/admin'
  end

  private
  def authorize
    if !current_owner.has_role? :admin
      render text:"No access for you!"
    end
  end

end
