module FooterHelper
  def github_url(author, repo)
    link_to author, repo
  end

  def years_now
    Time.current.year
  end
end
