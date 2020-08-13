class Artist < ApplicationRecord
    has_many :movies
    has_many :genres, through: :movies
    validates_presence_of :gender, :age, :name
    validates :age, numericality: {:message => "%{value} seems wrong. Please, enter the age in numbers"}
   # validate :movies_attributes

    accepts_nested_attributes_for :movies
    # accepts_nested_attributes_for :genres

    def genres_attributes(genre_attributes)
        genre_attributes.values.each do |genre_attribute|
            genre = Genre.find_or_create_by(genre_attribute)
            self.genres << genre
        end
    end
    
    # def movies_attributes=(movie_attributes)
    #     self.movie = Movie.where(:name => movie_attributes[:name]).first_or_create do
    #         t.title = movie_attributes[:title]
    #         t.budget = movie_attributes[:budget]
    #         t.duration = movie_attributes[:duration]
    #     end
    # end

    # def movies_attributes=(movies_attributes)
    #     movies_attributes.each do |i, movie_attributes|
    #         if movie_attributes[:title].present?
    #         movie = Movie.find_or_create_by(title: movie_attributes[:title])
    #         if !self.movies.include?(movie)
    #             self.artist_movies.build(movie: movie) # if there is artist_movies joined table
    #         end
    #         # self.movies << movie # shovelling will invoke whole database each time, better use build method
          
    #      # self.movies.build(movie: movie)
    #     end
    #     end
    # end

end
