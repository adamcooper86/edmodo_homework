class StudentsController < ApplicationController

  def show
    @student = User.find(params[:id])
    @assignments = @student.student_assignments
  end

end
