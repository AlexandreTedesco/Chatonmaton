# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      redirect_to @user
      flash[:success] = "L'utilisateur a été créé avec succès."
    else
      render 'new'
      flash[:error] = "Une erreur a été détectée : #{user.errors.full_messages.join(", ")}"
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to @user
      flash[:success] = "Votre profil a bien été modifié"
    else
      redirect_to 'edit'
      flash[:error] = "Une erreur a été détectée : #{@user.errors.full_messages.join(",")}"
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    redirect_to root_path
    flash[:success] = "L'utilisateur a été supprimé avec succès."
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :description, :profile_picture)
  end
end
