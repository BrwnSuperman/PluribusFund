json.array!(@projects) do |project|
  json.extract! project, :project_name, :project_owner, :project_goal
  json.url project_url(project, format: :json)
end
