class LendingsController < ApplicationController
  before_action :set_lending, only: %i[ show edit update destroy ]

  def index
    @lendings = Lending.all
  end

  def show
  end

  def new
    @lending = Lending.new
  end

  def edit
  end

  def create
    @lending = Lending.new(lending_params)

    respond_to do |format|
      if @lending.save
        format.html { redirect_to @lending, notice: "Lending was successfully created." }
        format.json { render :show, status: :created, location: @lending }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lending.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lending.update(lending_params)
        format.html { redirect_to @lending, notice: "Lending was successfully updated." }
        format.json { render :show, status: :ok, location: @lending }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lending.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lending.destroy
    respond_to do |format|
      format.html { redirect_to lendings_url, notice: "Lending was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_lending
      @lending = Lending.find(params[:id])
    end

    def lending_params
      params.require(:lending).permit(:item_name, :lending_at, :expected_return_at, :lender_id, :borrower_id)
    end
end
