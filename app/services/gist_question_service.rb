class GistQuestionService
  include ActionView::Helpers::TranslationHelper

  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.status == 201
  end

  private

  def gist_params
    {
      description: t('gist_question_servise.gist_params.title', test: @test.title),
      files: {
        'test-guru-question.txt': {
          content: gist_content }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
