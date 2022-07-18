# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string
#  pot_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :pot
  validates :content, presence: { message: '!Upss el texto es requerido'}
  validates :content, length: { maximum:200, minimum: 4}

  has_many :votes, as: :votable # relación con pot para votos
end
