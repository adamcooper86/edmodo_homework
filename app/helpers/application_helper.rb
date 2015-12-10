module ApplicationHelper
  def new_submission_path assignment
    "/submissions/new?assignment_id=#{assignment.id}"
  end
end
