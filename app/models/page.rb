require 'open-uri'

class Page < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true, uniqueness: true
  validates :url,
    format: {
      with: /\A(http|https):\/\//,
      message: %{
        The URL is invalid and cannot be saved.
        Please use a valid URL beginning with http:// or https://
      }
    }

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

  private

  def document
    @document ||= open(url, allow_redirections: :safe).read
  end
end
