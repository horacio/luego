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

  scope :active, -> { where(archived: false) }
  scope :archived, -> { where(archived: true) }

  def archive
    self.update_attribute(:archived, true)
  end

  def restore
    self.update_attribute(:archived, false)
  end

  def parse!
    ParserWorker.perform_async(self.id)
  end
end
