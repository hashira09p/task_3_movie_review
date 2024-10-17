# Create genres first to ensure they exist before assigning to movies
genres = Genre.create([
                        { name: 'Action' },
                        { name: 'Comedy' },
                        { name: 'Drama' },
                        { name: 'Horror' },
                        { name: 'Fantasy' },
                        { name: 'Thriller' },
                        { name: 'Romance' },
                        { name: 'Documentary' },
                        { name: 'Animation' },
                        { name: 'Adventure' },
                        { name: 'Mystery' },
                        { name: 'Musical' },
                        { name: 'Biography' }
                      ])

# Create movies with the appropriate genre associations
=begin
user1 = User.create(email: "wla@gmail.com")
Movie.create!([
                {
                  title: "Inception",
                  blurb: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.",
                  genres: genres.select { |g| ["Science Fiction", "Action", "Adventure"].include?(g.name) },
                  date_released: Date.new(2010, 7, 16),
                  showing_start: DateTime.new(2023, 10, 1, 19, 0),
                  showing_end: DateTime.new(2023, 10, 1, 21, 30),
                  image: nil,
                  country_of_origin: "USA",
                  user: user1
                },
                {
                  title: "The Matrix",
                  blurb: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.",
                  genres: genres.select { |g| ["Action", "Science Fiction"].include?(g.name) },
                  date_released: Date.new(1999, 3, 31),
                  showing_start: DateTime.new(2023, 10, 5, 20, 0),
                  showing_end: DateTime.new(2023, 10, 5, 22, 0),
                  image: nil,
                  country_of_origin: "USA",
                  user: user1
                },
                {
                  title: "Interstellar",
                  blurb: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
                  genres: genres.select { |g| ["Adventure", "Drama", "Science Fiction"].include?(g.name) },
                  date_released: Date.new(2014, 11, 7),
                  showing_start: DateTime.new(2023, 10, 10, 18, 30),
                  showing_end: DateTime.new(2023, 10, 10, 21, 0),
                  image: nil,
                  country_of_origin: "USA",
                  user: user1
                },
                {
                  title: "Blade Runner 2049",
                  blurb: "A young blade runner's discovery of a long-buried secret leads him to track down former blade runner Rick Deckard, who's been missing for thirty years.",
                  genres: genres.select { |g| ["Science Fiction", "Drama", "Mystery"].include?(g.name) },
                  date_released: Date.new(2017, 10, 6),
                  showing_start: DateTime.new(2023, 10, 15, 19, 0),
                  showing_end: DateTime.new(2023, 10, 15, 22, 0),
                  image: nil,
                  country_of_origin: "USA",
                  user: user1
                },
                {
                  title: "Gravity",
                  blurb: "Two astronauts work together to survive after an accident leaves them stranded in space.",
                  genres: genres.select { |g| ["Science Fiction", "Thriller", "Drama"].include?(g.name) },
                  date_released: Date.new(2013, 10, 4),
                  showing_start: DateTime.new(2023, 10, 20, 18, 30),
                  showing_end: DateTime.new(2023, 10, 20, 20, 0),
                  image: nil,
                  country_of_origin: "USA",
                  user: user1
                },
                {
                  title: "Arrival",
                  blurb: "A linguist is recruited by the military to communicate with alien lifeforms after twelve mysterious spacecraft appear around the world.",
                  genres: genres.select { |g| ["Science Fiction", "Drama", "Mystery"].include?(g.name) },
                  date_released: Date.new(2016, 11, 11),
                  showing_start: DateTime.new(2023, 10, 25, 19, 0),
                  showing_end: DateTime.new(2023, 10, 25, 21, 30),
                  image: nil,
                  country_of_origin: "USA",
                  user: user1
                },
                {
                  title: "The Martian",
                  blurb: "An astronaut becomes stranded on Mars and must devise a way to survive while awaiting rescue.",
                  genres: genres.select { |g| ["Science Fiction", "Adventure", "Drama"].include?(g.name) },
                  date_released: Date.new(2015, 10, 2),
                  showing_start: DateTime.new(2023, 10, 30, 18, 0),
                  showing_end: DateTime.new(2023, 10, 30, 21, 0),
                  image: nil,
                  country_of_origin: "USA",
                  user: user1
                }
              ])
=end

