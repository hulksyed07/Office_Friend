json.array!(@issues) do |issue|
  json.extract! issue, :id, :description, :asker_id, :technology_id, :is_solved, :archived
  json.url issue_url(issue, format: :json)
end
