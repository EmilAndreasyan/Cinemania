+ Use the Ruby on Rails framework.

+ Your models must:

+ • Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

+ • Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

+ Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

+ You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

+ Your application must provide standard user authentication, including signup, login, logout, and passwords.

Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

+ You must include and make use of a nested resource with the appropriate RESTful URLs.

+ You must include a nested new route with form that relates to the parent resource

+ You must include a nested index or show route

 Your forms should correctly display validation errors.

a. Your fields should be enclosed within a fields_with_errors class

+ b. Error messages describing the validation failures must be present within the view.

Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

• Logic present in your controllers should be encapsulated as methods in your models.

• Your views should use helper methods and partials when appropriate.

• Follow patterns in the Rails Style Guide and the Ruby Style Guide.

+ Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.

rails g model
- secure password (has_secure_password, password_digest in table only, bcrypt gem, user.authenticate(params[:password]))
- validations (presence, uniqueness)
rails g controller
- routes (resources, only: [:], except: [:])
- helpers methods in helper folder
session controller
- before action


create join table artist_movie
class Artist
 has_many :artist_movies
 has_many :movies, through: :artist_movies
 accepts_nested_attributes_for :movies
end

 Questions
 - chainable scope method
 - OmniAuth
- how to user helper method in views
 - how to prevent repetitive data from creation in controller (find_or_create)
 - field_with_errors tag
 - how to display all movies where Genre name == drama
 - omniauth route path sessions#create
 
 - nokogiri
 - capybara gem
 - <%= f.hidden_field :artist_id, value: @artist.id %> hidden field tag for parent or child, how does it work?
 - how to indicate Movie.artist (movie belongs to artist) if there is no direct realtionship, but indirectly through join table artist_movies?
 - how to use image in table, how to upload a file (image) from form