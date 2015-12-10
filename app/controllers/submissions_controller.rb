class SubmissionsController < ApplicationController
  def new
    @user = current_user
    @assignment = Assignment.find(params[:assignment_id])
    @homework = @assignment.homework
    @submission = Submission.new homework_id: @homework.id
  end

  def create
    @user = current_user
    @assignment = Assignment.find(params[:assignment_id])
    @homework = @assignment.homework
    @submission = Submission.new homework_id: @homework.id, answer: params[:answer]
    if not_closed && @submission.save
      redirect_to homework_path @homework
    else
      flash[:notice] = "Submission not created - passed submission deadline"
      redirect_to homework_path @homework
    end
  end

private
  def not_closed
    Time.now <= @homework.due
  end
end
