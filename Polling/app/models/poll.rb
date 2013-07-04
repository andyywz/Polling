class Poll < ActiveRecord::Base
  attr_accessible :title

  belongs_to :user
  has_many :questions

  validates :user_id, :presence => true

  def make_question(body)
    self.questions.create!(body: body)
  end

  def ask_questions
    questions.map { |q| q.ask }
  end


end

# user1.polls.create!(:title => "hello")