module MoviesHelper
    def expensive_movies(user_movies)
        titles = []
        user_movies.each do |movie|  
            titles << movie.title if movie.budget >= 10000000
        end
        titles.join(", ")
    end
end
