require 'rest-client'
require_relative 'util/logger'

# Main Pet finding search class
class DogFinder
  def initialize
    @logger = Logging.setup('PetFinder')
  end

  def search
    RestClient.get 'https://api.petfinder.com/', {params: {id: 50, 'foo' => 'bar'}}
  end
end
