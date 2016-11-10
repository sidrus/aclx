module ApplicationHelper
  def formatted_time_distance_from_now(time)
    if time < DateTime.now
      "#{distance_of_time_in_words_to_now(time)} ago"
    else
      "#{distance_of_time_in_words_to_now(time)} from now"
    end
  end
end
