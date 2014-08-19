class Page < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true, uniqueness: true

  default_scope { order("created_at DESC") }

  scope :active, -> { where(archived: false) }
  scope :archived, -> { where(archived: true) }

  def archive
    self.update_attribute(:archived, true)
  end

  def restore
    self.update_attribute(:archived, false)
  end
end
