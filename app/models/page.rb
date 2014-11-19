require 'open-uri'

class Page < ActiveRecord::Base
  belongs_to :user

  validates :url,
    presence: true,
    uniqueness: true,
    format: { with: /http|https/ }

  default_scope { order("created_at DESC") }

  scope :active, -> { where(archived: false) }
  scope :archived, -> { where(archived: true) }

  def archive
    self.update_attribute(:archived, true)
  end

  def restore
    self.update_attribute(:archived, false)
  end

  def parse!
    self.title = Parsers::Title.parse(document)
    self.body = Parsers::Body.parse(document)

    save
  end

  def document
    @document ||= open(url, allow_redirections: :safe).read
  end
end
