class Archive
  def initialize(user)
    @user = user
  end

  def pages
    @user.archived_pages
  end
end
