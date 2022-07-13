# == Schema Information
#
# Table name: pots
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  visible     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class PotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
