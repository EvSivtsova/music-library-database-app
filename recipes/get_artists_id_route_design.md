# GET /artists/:id Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method 
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

  Method: GET
  Path: /artists/:id
  Parameter: id

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- Example for GET /artists/1 -->

<html>
  <head></head>
  <body>
    <h1>Pixies</h1>
    <p>
      Genre: Rock
    </p>
  </body>
</html>

<!-- Example for GET /artists/2 -->

<html>
  <head></head>
  <body>
    <h1>ABBA</h1>
    <p>
      Genre: Pop
    </p>
  </body>
</html>

```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /artists/1

# Expected response:

Response (200 OK):
<h1>Pixies</h1>
    <p>Genre: Rock</p>
    
# Request:

GET /artists/2

# Expected response:

Response (200 OK):
    <h1>ABBA</h1>
    <p>Genre: Pop</p>

```


## 4. Encode as Tests Examples

```ruby

# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

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
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
