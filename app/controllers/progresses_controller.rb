class ProgressesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]
  before_action :check_time, only: %i[show update]
  def show
  end

  def result
    BadgeService.new.call(@progress) if @progress.success
  end

  def update
    @progress.accept!(params[:answer_id] ||= [])

    if @progress.completed?
      @progress.save_result
      redirect_to result_progress_path(@progress)
    else
      render :show
    end
  end

  private

  def check_time
    return if @progress.time_has_passed < @progress.test.time_to_complete
    @progress.save_result
    redirect_to result_progress_path(@progress)
  end

  def set_test_passage
    @progress = Progress.find(params[:id])
  end
end
