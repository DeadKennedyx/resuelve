require 'rails_helper'

RSpec.describe Team, type: :model do
  it { is_expected.to have_one :team_goal }

end
