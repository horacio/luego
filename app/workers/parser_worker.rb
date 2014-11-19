class ParserWorker
  include Sidekiq::Worker

  def perform(page_id)
    page = Page.find(page_id)

    document = open(page.url, allow_redirections: :safe).read

    page.title = Parsers::Title.parse(document)
    page.body = Parsers::Body.parse(document)

    page.save
  end
end
