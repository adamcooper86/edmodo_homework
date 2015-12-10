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
    if @submission.save
      redirect_to homework_path @homework
    else
      redirect_to user_path @user
    end
  end
end
