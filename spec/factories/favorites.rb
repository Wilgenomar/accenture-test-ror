FactoryBot.define do
    factory :favorite do
      user { build(:user) }
      book { build(:book) }
    end
  end