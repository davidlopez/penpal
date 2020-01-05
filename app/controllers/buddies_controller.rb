class BuddiesController < ApplicationController
  before_action :logged_in?, :survey_not_completed?
  
  def index; end

  def new; end

  def create
    buddy = current_user.buddies.new(buddy_params)
    if buddy.save
      flash[:success] = 'Successfully added buddy!'
      redirect_to '/buddies'
    else
      flash[:error] = buddy.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @buddy = current_user.buddies.find(params[:id])
  end

  def update
    @buddy = current_user.buddies.find(params[:id])
    @buddy.update(buddy_params)
    if @buddy.save
      flash[:success] = 'Buddy Updated!'
      redirect_to '/buddies'
    else
      flash[:error] = @buddy.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    current_user.buddies.destroy(params[:id])

    flash[:success] = 'Buddy Deleted'
    redirect_to '/buddies'
  end

  private

  def buddy_params
    params.permit(:first_name, :last_name, :email, :phone_number)
  end
end
