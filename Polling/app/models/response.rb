class Response < ActiveRecord::Base
  attr_accessible :choice_id, :user_id

  belongs_to :user
  belongs_to :choice
  has_one :question, :through => :choice

  validates :user_id, :presence => true
  validates :choice_id, :presence => true
  validate :no_repeat_answer

  def user_cannot_have_mult_resp_per_question
    # if User.find(user_id).responses.
  end

  def no_repeat_answer
    if self.question.responses.where(user_id: user_id).count > 0
      errors[:user_id] << "cannot answer a question more than once."
    end
  end

end