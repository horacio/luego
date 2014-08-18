class Archive
  def initialize(user)
    @user = user
  end

  def links
    @user.archived_links
  end
end
