require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User table #Check_Validations' do
    it { should validate_presence_of(:name) }

    it { should have_many(:created_events).with_foreign_key('creator_id').class_name('Event') }
  end
end