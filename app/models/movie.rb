class Movie < ActiveRecord::Base
    has_many :episodes
    has_many :parts 
	has_many :actors, through: :parts
	acts_as_followable
end
