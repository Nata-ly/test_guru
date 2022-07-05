class ProgressesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]
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

  def gist
    result = GistQuestionService.new(@progress.current_question).call
    flash_options = if result.html_url
      { notice: "#{t('.succes', url: result.html_url)}" }
    else
      { alert: t('.failure') }
    end
    redirect_to @progress, flash_options
  end

  private

  def set_test_passage
    @progress = Progress.find(params[:id])
  end
end
