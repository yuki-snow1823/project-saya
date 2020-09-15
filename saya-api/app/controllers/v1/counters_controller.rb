class V1::CountersController < ApplicationController

  def show
    @counter = Counter.find(1)
    render json: {test: @counter}
  end

  def update
    @counter = Counter.find(1)
    @counter.count = @counter.count + 1
    @counter.save
    render json: {test: @counter}
  end

  # private
  # def counter_params
  #   params.require(:counter).permit(:count)
  # end

end
