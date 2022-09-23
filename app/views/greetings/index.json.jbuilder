json.array! @greetings do |greeting|
  json.id greeting.id
  json.message greeting.message
end
