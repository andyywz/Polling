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
    result_hash = self.responses.group(choice_id).count
    choices.map { |choice| [choice.id,choice.body] }
    result_hash.each do |k,v|

    end
  end
end

# responses = question.responses.includes(:choice)