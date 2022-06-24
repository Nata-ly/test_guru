class ProgressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update]
  def show
  end

  def result
  end

  def update
    @progress.accept!(params[:answer_id] ||= [])

    if @progress.completed?
      redirect_to result_progress_path(@progress)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @progress = Progress.find(params[:id])
  end
end
