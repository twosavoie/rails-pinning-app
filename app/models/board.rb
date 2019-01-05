class Board < ActiveRecord::Base
  belongs_to :user
  has_many :pinnings, inverse_of: :board, dependent: :destroy
  has_many :pins, through: :pinnings
  has_many :board_pinners, inverse_of: :board, dependent: :destroy

  validates_presence_of :name

  accepts_nested_attributes_for :board_pinners, allow_destroy: true 

end
