require "#{File.expand_path('../..', __FILE__)}/lib/dog_finder"
print 'What US zip code should we use for this search? '
zip_code = gets.chomp
DogFinder.new(zip_code).search
