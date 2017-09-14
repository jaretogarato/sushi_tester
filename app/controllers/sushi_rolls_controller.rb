class SushiRollsController < ApplicationController
  before_action :set_sushi_roll, only: [:show, :edit, :update, :destroy]

  def index
    flash[:notice] = 'Welcome to your sushi order!'
    @rolls = current_user.sushi_rolls
  end

  def new
    @roll = SushiRoll.new
  end

  def create
    # render new with flash message
    @roll = SushiRoll.new(sushi_rolls_params)

    respond_to do |format|
      if @roll.save
        format.html { redirect_to @roll, notice: 'Roll was successfully created.' }
        format.json { render :show, status: :created, location: @roll }
      else
        format.html { render :new }
        format.json { render json: @roll.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @roll.destroy
    redirect_to root_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sushi_roll
    @roll = current_user.sushi_rolls.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def sushi_rolls_params
    # params.require(:sushi_rolls).permit(:name, :price, :first_ingredient, :second_ingredient)
    params.permit(:name, :price, :first_ingredient, :second_ingredient)
  end
end
