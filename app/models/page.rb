require 'open-uri'

class Page < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true, uniqueness: true

  default_scope { order("created_at DESC") }

  scope :active, -> { where(archived: false) }
  scope :archived, -> { where(archived: true) }

  attr_accessor :body, :document, :title

  def initialize(url)
    @url = url
  end

  def archive
    self.update_attribute(:archived, true)
  end

  def restore
    self.update_attribute(:archived, false)
  end

  def parse!
    @title = Parsers::Title.parse(document)
    @body = Parsers::Body.parse(document)

    save
  end

  def document
    @document ||= open(url).read
  end

  def url
    if @url.start_with?('http') || @url.start_with('https')
      @url
    else
      "http://#{@url}"
    end
  end
end
