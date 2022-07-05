class GistsController < ApplicationController
  def create
    @progress = Progress.find(params[:progress_id])
    service = GistQuestionService.new(@progress.current_question)
    result = service.call
    if service.success?
      flash_options = { notice: "#{t('.succes', url: result.html_url)}" }
      @progress.current_question.gists.create(user: current_user, url: result.html_url)
    else
      flash_options = { alert: t('.failure') }
    end
    redirect_to @progress, flash_options
  end
end
