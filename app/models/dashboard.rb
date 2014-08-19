class Dashboard
  def initialize(user)
    @user = user
  end

  def new_page
    Page.new
  end

  def pages
    @user.active_pages
  end
end
