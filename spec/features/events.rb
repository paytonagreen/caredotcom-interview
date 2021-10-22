require 'rails_helper'
require 'vcr'

describe "Visiting the events page", type: :feature do 
  it "opens the page, renders the title" do
    VCR.use_cassette('caredotcom_api') do
      visit '/'
    end

    expect(page).to have_content('Our Best Events')
  end

  it "opens the page, renders the correct number of cards" do
    VCR.use_cassette('caredotcom_api') do
      visit '/'
    end

    page.all('div.card', count: 30)
  end

  it "formats and renders an activity card correctly" do
    VCR.use_cassette('caredotcom_api') do
      visit '/'
    end

    activity_card = page.all('div.card')[0]

    expect(activity_card).to have_content('Colorado Yoga')
    expect(activity_card).to have_content('Location: Boulder, Colorado')
    expect(activity_card).to have_content('Price: $25.00')
    expect(activity_card).to have_content('Time: Friday Oct 22, 08:00AM')
  end

  it "formats and renders a series card correctly" do
    VCR.use_cassette('caredotcom_api') do
      visit '/'
    end

    series_card = page.all('div.card')[29]

    expect(series_card).to have_content('Location: San Francisco, California')
    expect(series_card).to have_content('Time: Wednesday Oct 20, 03:00PM')
  end
end

describe EventsController, type: :request do 
  it "makes a request & parses an activity from JSON to OpenStruct object correctly" do
    VCR.use_cassette('caredotcom_api') do
      get events_path
    end
    
    expect(assigns[:activities].length).to be(29)
    expect(assigns[:activities][0]['title']).to eq('Colorado Yoga')
    expect(assigns[:activities][0]['price']).to eq('25.0')
    expect(assigns[:activities][0]['start_time_iso_string']).to eq('2021-10-22T08:00:00-06:00')
    expect(assigns[:activities][0]['activity_location']['location']['city']).to eq('Boulder')

  end

  it "makes a request & parses a series from JSON to OpenStruct object correctly" do
    VCR.use_cassette('caredotcom_api') do
      get events_path
    end
    
    expect(assigns[:series].length).to be(1)
    expect(assigns[:series][0]['title']).to eq('big series DUPLICATE TEST')
    expect(assigns[:series][0]['price']).to eq('100.0')
    expect(assigns[:series][0]['sessions'][0]['start_time_iso_string']).to eq('2021-10-20T15:00:00-04:00')
    expect(assigns[:series][0]['location_series']['location']['city']).to eq('San Francisco')

  end
end