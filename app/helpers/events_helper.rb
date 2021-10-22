module EventsHelper
  def format_location(event)
    raw_location = event[is_activity(event) ? 'activity_location' : 'location_series'].location
    event_location = "#{raw_location['city']}, #{raw_location['state']}"
    formatted_location = (event_location.length <= 3) ? 'Online' : event_location

    return formatted_location
  end

  def format_date(event)
    iso_string = is_activity(event) ? event["start_time_iso_string"] : event['sessions'][0]["start_time_iso_string"]
    
    return DateTime.parse(iso_string).strftime("%A %b %d, %I:%M%p")
  end

  def is_activity(event)
    !event['sessions'] || event['sessions'].length == 0
  end
end