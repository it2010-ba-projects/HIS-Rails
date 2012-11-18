# -*- encoding: utf-8 -*-
class SetupController < ApplicationController
  before_filter :check
  skip_before_filter :authenticate_user!
  
  def index
    @user = User.new
    @user.login = 'admin'
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user }
    end
  end
  
  def create
    @user = User.new(params[:user])
    
    @user.login = 'admin'
    @user.groups << Group.find_by_name(:admin)
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to new_user_session_path, notice: "Setup erfolgreich abgeschlossen. Sie können sich jetzt als Administrator einloggen."}
        format.json { render json: @user, status: created, location: @user }
      else        
        format.html { render action: "index" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    def check
      redirect_to root_path if User.exists?(login: :admin)
    end
end