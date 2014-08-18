class Dashboard
  def initialize(user)
    @user = user
  end

  def new_link
    Link.new
  end

  def links
    @user.active_links
  end
end