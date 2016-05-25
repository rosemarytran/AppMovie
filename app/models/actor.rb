class Actor < ActiveRecord::Base
    filterrific(
        #default_filter_params: { sorted_by: 'created_at_desc' },
        available_filters: [
        :search_query
        ]
    )
    # define ActiveRecord scopes for
    # :search_query, :sorted_by
    has_many :parts 
    has_many :movies, through: :parts
    	scope :search_query, lambda { |query|
        return nil  if query.blank?
        where('first_name LIKE ? OR last_name LIKE ?', "%#{query}%", "%#{query}%")
    }
end
