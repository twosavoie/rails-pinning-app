class Board < ActiveRecord::Base
  belongs_to :user
  has_many :pinnings, inverse_of: :board, dependent: :destroy 
  has_many :pins, through: :pinnings

  validates_presence_of :name
end
