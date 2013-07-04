class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :users

  validates :name, :presence => true, :format => { :with => /\A[a-zA-Z]+\z/ }







end