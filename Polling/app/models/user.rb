class User < ActiveRecord::Base
  attr_accessible :username

  has_many :polls
  has_many :responses
  belongs_to :team

  validates :username, :uniqueness => true, :presence => true

  def make_poll(title)
    self.polls.create!(title: title)
  end

  def take_poll(poll)
    raise "Can't take your own poll." if poll.user == self
    if poll.restricted && poll.user.team != self.team
      raise "This poll is restricted to the author's team."
    end
    poll.ask_questions
  end




end