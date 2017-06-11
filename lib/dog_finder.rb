require 'rest-client'
require 'json'
require_relative 'util/logger'
require_relative 'util/doggos'

# Main Pet finding search class
class DogFinder
  def initialize(zip_code)
    @logger = Logging.setup('DogFinder')
    @zip = zip_code
  end

  def search
    @logger.info('Searching for Hypoallergenic Doggos in your location')
    results = []
    # TODO: robustify this
    Doggos.hypo_doggos.each do |breed|
      @logger.info("Searching for #{breed}")
      resp = RestClient.get('https://api.petfinder.com/pet.find',
                            params: search_params(breed))
      body = JSON.parse(resp.body)
      results << body['petfinder']['pets']
    end

    @logger.info(results)
  end

  private

  def search_params(breed)
    {
      key: ENV['API_KEY'],
      animal: 'dog',
      location: @zip,
      breed: breed,
      format: 'json'
    }
  end
end
