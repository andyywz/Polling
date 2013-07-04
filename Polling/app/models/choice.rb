class Choice < ActiveRecord::Base
  attr_accessible :question_id, :body

  belongs_to :question
  has_many :responses

  validates :question_id, :presence => true
end