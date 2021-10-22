module EventsHelper
  def format_location(event, event_type)
    raw_location = event[event_type === 'series' ? 'location_series' : 'activity_location'].location
    event_location = "#{raw_location['city']}, #{raw_location['state']}"
    formatted_location = (event_location.length <= 3) ? 'Online' : event_location

    return formatted_location
  end

  def format_date(event)
    return DateTime.parse(event["start_time_iso_string"]).strftime("%A %b %d, %I:%M%p")
  end
end