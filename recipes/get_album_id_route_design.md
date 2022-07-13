# GET /albums/:id Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method 
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

  Method: GET
  Path: /albums/:id
  Parameter: id

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- Example for GET /albums/1 -->

<html>
  <head></head>
  <body>
    <h1>Doolittle</h1>
    <p>
      Release year: 1989
      Artist: Pixies
    </p>
  </body>
</html>

<!-- Example for GET /albums/2 -->

<html>
  <head></head>
  <body>
    <h1>Surfer Rosa</h1>
    <p>
      Release year: 1988
      Artist: Pixies
    </p>
  </body>
</html>

```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /albums/1

# Expected response:

Response (200 OK):
<h1>Doolittle</h1>
    <p>Release year: 1989</p>
    <p>Artist: Pixies</p>
    
# Request:

GET /albums/2

# Expected response:

Response (200 OK):
<h1>Surfer Rosa</h1>
    <p>Release year: 1988</p>
    <p>Artist: Pixies</p>

```


## 4. Encode as Tests Examples

```ruby

# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

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
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
