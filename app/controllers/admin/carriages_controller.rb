class Admin::CarriagesController < Admin::BaseController
  before_action :set_carriage, only: %i[show edit update destroy]
  before_action :set_train, only: %i[new create]

  def index; end

  def show; end

  def new
    @carriage = @train.carriages.build
  end

  def create
    @carriage = @train.carriages.build(carriage_params)

    if @carriage.save
      redirect_to admin_train_path(@carriage.train), notice: 'Carriage was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy
    @carriage.destroy
    redirect_to admin_train_path(@carriage.train), notice: 'Carriage was successfully destroyed.'
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def carriage_params
    params.require(:carriage).permit(:number, :type, :top_seats, :bottom_seats, :side_top_seats,
                                     :side_bottom_seats, :seat_seats)
  end
end
