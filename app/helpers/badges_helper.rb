module BadgesHelper
  def badge_category(str)
    t("admin.badges.index.#{str}")
  end
end
