class User < ActiveRecord::Base
  has_many :pages

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def active_pages
    pages.active
  end

  def archived_pages
    pages.archived
  end
end
