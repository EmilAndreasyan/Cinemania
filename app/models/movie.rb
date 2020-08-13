class Movie < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    belongs_to :artist

    validates_presence_of :title, :duration, :budget
    validates_numericality_of :budget

    
    # def genre_name=(name)
    #     self.genre = Genre.find_or_create_by(name: name)      
    # end

    # def genre_name
    #     self.genre ? self.genre.name : nil
    # end

    # def genre_attributes=(genre)
    #     self.genre = Genre.find_or_create_by(name: genre[:name])
    #     self.genre.update(genre)
    # end  
end
