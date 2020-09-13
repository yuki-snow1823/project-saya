class V1::CountersController < ApplicationController

  def update
    counter = Counter.find(1)
    counter.count = counter.count + 1
    counter.save
    render json: counter
  end

  # private
  # def counter_params
  #   params.require(:counter).permit(:count)
  # end

end
