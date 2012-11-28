class UserController < ApplicationController
  load_and_authorize_resource
  
  def index
    @users = User.scoped.select{|u| u.id != current_user.id }
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    params[:user][:group_ids] ||= []
    
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.deleted = true
  end
end
