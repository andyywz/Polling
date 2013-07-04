class Question < ActiveRecord::Base
  attr_accessible :poll_id, :body

  belongs_to :poll
  has_many :choices
  has_many :responses, :through => :choices

  validates :poll_id, :presence => true

  def make_choice(body)
    self.choices.create!(body: body)
  end

  def ask
    [body] + choices.map { |choice| choice.body }
  end

  def results
    loaded_choices = self.choices.includes(:responses)
    hash = Hash.new
    loaded_choices.each do |c|
      hash[c.body] = c.responses.length
    end
    hash
  end
end

# responses = question.responses.includes(:choice)