# -*- encoding: utf-8 -*-
class UserController < ApplicationController
  load_and_authorize_resource
  
  # GET /user
  # GET /user.json
  def index
    @users = User.scoped.select{|u| u.id != current_user.id && u.deleted == false }
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users}
    end
  end
  
  # GET /user/1
  # GET /user/1.json
  def show
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  
  # GET /user/new
  # GET /user/new.json
  def new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  
  # POST /user
  # POST /user.json
  def create
    @user = User.new(params[:user])
    @user.created_from = current_user
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_index_path, notice: 'Nutzer wurde erfolgreich angelegt.'}
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /user/1/edit
  def edit
    @user = User.find(params[:id])    
  end
  
  # PUT /user/1
  # PUT /user/1.json
  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    params[:user][:group_ids] ||= []
    
    if cannot? :manage, @user
      params[:user].delete_if {|key, value| key != :password or key != :password_confirmation }
    end
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: "Nutzer wurde aktualisiert." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.erorrs, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /user/1
  # DELETE /user/1.json
  def destroy
    @user = User.find(params[:id])
    # Setzt das deleted-Flag, statt den Datensatz zu löschen
    @user.destroy
    
    respond_to do |format|
      format.html { redirect_to user_index_url }
      format.json { head :no_content }
    end
  end
end
