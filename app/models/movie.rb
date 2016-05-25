class Movie < ActiveRecord::Base
  filterrific(
    default_filter_params: { sorted_by: 'release_year desc' },
    available_filters: [
      :sorted_by,
      :search_query
    ]
  )
  # define ActiveRecord scopes for
  # :search_query, :sorted_by

  has_many :episodes
  has_many :parts 
	has_many :actors, through: :parts
	acts_as_followable
	
	scope :search_query, lambda { |query|
      return nil  if query.blank?
      where('title LIKE ?', "%#{query}%")
  }
  
  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.rak
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    order("release_year #{ direction }")
  }
  
  def self.options_for_sorted_by
  [
    ['Release Year (newest first)', 'desc'],
    ['Release Year (oldest first)', 'asc']
  ]
  end

end
