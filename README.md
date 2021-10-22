# Cart.com Project, Improvments, v2

I hope I've made the best of this opportunity! I had a lot of fun getting this together. In this version:

- All JS functionality is ported over to Ruby
  - HTTP Request is made via controller, using 'net/http' library
  - All helper functions are written in Ruby, organized in `helpers/events_helper.rb`, referenced via embedded Ruby
  - Cards are properly rendered via `views/events/_event.html.erb` partial, using collection method to automatically map members to HTML
- Tests are improved
  - Used VCR library to capture a valid response from API, store for reuse
  - Stable data allows for improved assertions in tests
  - Tested proper deserialization of JSON object to OpenStruct Ruby object
  - Tested proper conversion of object attributes to properly formatted values in view
- Used env
  - Used `dotenv` gem to set up `.env` file, will be required to run code properly
  - Set up `.env` in root, add `API_KEY=YOUR_API_KEY_HERE`