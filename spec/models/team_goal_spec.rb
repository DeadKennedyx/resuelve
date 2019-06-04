require 'rails_helper'

RSpec.describe TeamGoal, type: :model do
  it { is_expected.to have_one :team }

end
