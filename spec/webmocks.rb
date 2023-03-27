def load_stubs
  google_maps_denver
  yelp_foodtrucks_denver
end

def google_maps_denver
  stub_request(:get, "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?fields=formatted_address,name,geometry&input=Denver&inputtype=textquery").
  with(
    headers: {
    'Accept'=>'*/*',
    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    'User-Agent'=>'Faraday v2.7.4'
    }, query: {"key": ENV['google_api_key']}).
  to_return(status: 200, body: File.read("spec/fixtures/google_find_denver_fixture.json"))
end

def yelp_foodtrucks_denver
  stub_request(:get, "https://api.yelp.com/v3/businesses/search").
  with(
    headers: {
    'Accept'=>'*/*',
    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    'Authorization'=>"Bearer #{ENV['yelp_api']}",
    'Content-Type'=>'application/json',
    'User-Agent'=>'Faraday v2.7.4'
    }, query: {"categories": "foodtrucks", "latitude": 39.7392358, "longitude": -104.990251, "radius": 20000, "limit": 20, "locale": "en_US"}).
  to_return(status: 200, body: File.read("spec/fixtures/yelp_foodtrucks_denver_radius_fixture.json"), headers: {})
end