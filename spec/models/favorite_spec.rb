require 'rails_helper'

RSpec.describe Favorite do
  subject(:favorite) { build(:favorite) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:book) }
  it { is_expected.to be_valid }
end