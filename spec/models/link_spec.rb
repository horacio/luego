require 'rails_helper'

describe Link, 'validations' do
  it { should validate_presence_of :url }
  it { should validate_uniqueness_of :url }
end

describe Link, 'associations' do
  it { should belong_to(:user) }
end
