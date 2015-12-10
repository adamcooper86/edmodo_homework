class HomeworksController < ApplicationController

  def show
    @homework = Homework.find(params[:id])
  end

  def edit
    @student = User.find(params[:student_id])
    @homework = Homework.find(params[:id])
  end

end
