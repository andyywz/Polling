class Poll < ActiveRecord::Base
  attr_accessible :title

  belongs_to :user
  has_many :questions
  has_many :responses, :through => :choices, :through => :questions

  validates :user_id, :presence => true

  def make_question(body)
    self.questions.create!(body: body)
  end

  def results
    loaded_questions = self.questions.includes(:choices => [:responses])
    loaded_questions.map do |loaded_q|
      hash = Hash.new
      loaded_q.choices.each do |c|
        hash[c.body] = c.responses.length
      end
      [loaded_q.body, hash]
    end
  end


  def ask_questions
    questions.map { |q| q.ask }
  end


end
