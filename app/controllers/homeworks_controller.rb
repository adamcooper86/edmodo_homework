class HomeworksController < ApplicationController

  def show
    @homework = Homework.find(params[:id])
    @user = current_user
    @submissions = submissions
  end

  def edit
    @student = User.find(params[:student_id])
    @homework = Homework.find(params[:id])
  end

private
  def submissions
    @student = User.find(params[:student_id]) if params[:student_id]
    if @student
      @homework.student_submissions @student
    else
      @homework.submissions
    end
  end
end
