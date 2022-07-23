module TestsHelper
  def quentions_count(test)
    test.questions.count
  end

  def format_time(time)
    hours = (time / 3600).to_i
    minutes = ((time % 3600) / 60).to_i
    seconds = ((time % 3600) % 60).to_i
    "#{sprintf '%02d', hours}:#{sprintf '%02d', minutes}:#{sprintf '%02d', seconds}"
  end
end
