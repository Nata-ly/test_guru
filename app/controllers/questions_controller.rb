class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @questions = @test.questions
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new
  end

  def create
    @question = @test.questions.create(question_params)
    redirect_to test_questions_path(@question.test)
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: t('error.rescue_with_test_not_found')
  end
end
