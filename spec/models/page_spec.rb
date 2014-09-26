require 'rails_helper'

describe Page, 'validations' do
  it { should validate_presence_of :url }
  it { should validate_uniqueness_of :url }
end

describe Page, 'associations' do
  it { should belong_to(:user) }
end

describe Page do
  describe '#parse!' do
    subject(:page) { Page.create(url: 'http://svankmajer.net' ) }

    it 'parses the title' do
      page.parse!

      expect(page.title).to eq('svankmajer.net')
    end

    it 'parses the body' do
      page.parse!

      expect(page.body).to match(/Feel free to contact me/)
    end
  end
end
