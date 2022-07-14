# == Schema Information
#
# Table name: pot_categories
#
#  id          :integer          not null, primary key
#  pot_id      :integer          not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class PotCategory < ApplicationRecord
  belongs_to :pot
  belongs_to :category
end
