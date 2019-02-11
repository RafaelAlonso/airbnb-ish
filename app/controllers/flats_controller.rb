require "open-uri"
class FlatsController < ApplicationController
  def index
    @flats = flats
  end

  def show
    @flat = find(params[:id].to_i)
  end

  private

  def find(id)
    flats.find {|flat| flat["id"] == id}
  end

  def flats
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    JSON.parse(open(url).read)
  end
end
