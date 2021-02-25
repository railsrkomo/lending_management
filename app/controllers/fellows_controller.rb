class FellowsController < ApplicationController
  before_action :set_fellow, only: %i[ show edit update destroy ]

  def index
    # @fellows = Fellow.all
    @fellows = current_user.fellows
  end

  def show
  end

  def new
    # @fellow = Fellow.new
    @fellow = current_user.fellows.new
  end

  def edit
  end

  def create
    # @fellow = Fellow.new(fellow_params)
    @fellow = current_user.fellows.new(fellow_params)
    if @fellow.save
      redirect_to @fellow, notice: "Fellow was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @fellow.update(fellow_params)
      redirect_to @fellow, notice: "Fellow was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fellow.destroy
    redirect_to fellows_url, notice: "Fellow was successfully destroyed."
  end

  private
    def set_fellow
      @fellow = Fellow.find(params[:id])
    end

    def fellow_params
      params.require(:fellow).permit(:friend_id, :own_id, :reason_of, :relation_since, :friend_email)
    end
end
