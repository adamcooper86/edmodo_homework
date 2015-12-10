module ApplicationHelper
  def new_submission_path assignment
    "/submissions/new?assignment_id=#{assignment.id}"
  end

  def student_homework_path student, homework
    "/homeworks/#{homework.id}?student_id=#{student.id}"
  end
end
