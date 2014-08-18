class User < ActiveRecord::Base
  has_many :links

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def active_links
    links.active
  end

  def archived_links
    links.archived
  end
end
