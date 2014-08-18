class Link < ActiveRecord::Base
  belongs_to :user

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
