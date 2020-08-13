class Genre < ApplicationRecord
    has_many :movies
    has_many :artists, through: :movies
    validates_presence_of :name

    accepts_nested_attributes_for :movies
    # accepts_nested_attributes_for :artists

    scope :action, -> {where(:name => "action").order(id: :desc).limit(5)} # scope for filtering is the same as class method
    scope :drama, -> {where(:name => "drama").order(id: :asc).limit(1)}

    def artists_attributes(artist_attributes)
        artist_attributes.values.each do |artist_attribute|
            artist = Artist.find_or_create_by(artist_attribute)
            self.artists << artist
        end

    end
        
end
