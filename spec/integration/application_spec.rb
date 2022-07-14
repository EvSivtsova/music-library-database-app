require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_tables
  seed_sql = File.read('spec/seeds/music_library.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do 
    reset_tables
  end

  include Rack::Test::Methods
  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }
  # This is so we can use rack-test helper methods.

  context "GET /albums" do
    it 'returns 200 OK and lists all albums with their release year' do
      response = get('/albums')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Albums</h1>')
      expect(response.body).to include("<div>", "</div>")
      expect(response.body).to include("<p>Title: <a href='/albums/1'> Doolittle </a>")
      expect(response.body).to include("<p>Title: <a href='/albums/2'> Surfer Rosa </a>")
    end
  end

  context "POST /albums" do
    it 'creates a new album and returns 200 OK' do
      response = post(
        '/albums', 
        title: 'Voyage', 
        release_year: '2022', 
        artist_id: '2'
      )

      expect(response.status).to eq(200)
      expect(response.body).to eq('')
      response = get('/albums')
      expect(response.body).to include('Voyage')
    end
  end
  
  context "GET /albums/:id" do
    it 'returns the first album when id = 1' do
      response = get('/albums/1')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Doolittle</h1>')
      expect(response.body).to include('<p>Release year: 1989</p>')
      expect(response.body).to include('<p>Artist: Pixies</p>')
    end

    it 'returns the second album when id = 2' do
      response = get('/albums/2')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Surfer Rosa</h1>')
      expect(response.body).to include('<p>Release year: 1988</p>')
      expect(response.body).to include('<p>Artist: Pixies</p>')
    end
  end

  context "GET /artists" do
    it 'returns 200 OK and lists all artists linking the names to individual artist pages' do
      response = get('/artists')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Artists</h1>")
      expect(response.body).to include("<div>", "</div>")
      expect(response.body).to include("<a href='/artists/1'>Pixies</a>")
                                      "<a href='artists/1'>Pixies</a>"
      expect(response.body).to include("<a href='/artists/2'>ABBA</a>")
    end
  end

  context "POST /artists" do
    it 'creates a new artist and returns 200 OK' do
      response = post(
        '/artists', 
        name: "Wild nothing",
        genre: "Indie"
      )
      expect(response.status).to eq(200)
      expect(response.body).to eq("")
      response = get('/artists')
      expect(response.body).to include('Wild nothing')
      # response_body = 'Pixies, ABBA, Taylor Swift, Nina Simone, Wild nothing'
      # expect(response.body).to eq(response_body)
    end
  end

  context "GET /artists/:id" do
    it 'returns the first artist when id = 1' do
      response = get('/artists/1')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Pixies</h1>')
      expect(response.body).to include('<p>Genre: Rock</p>')
    end

    it 'returns the second artist when id = 2' do
      response = get('/artists/2')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>ABBA</h1>')
      expect(response.body).to include('<p>Genre: Pop</p>')
    end
  end
end
