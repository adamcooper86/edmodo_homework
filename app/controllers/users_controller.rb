class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @assignments = assignments
    @homeworks = Assignment.homeworks_for @assignments
  end

private
  def assignments
    if @user.teacher?
      @user.teacher_assignments
    else
      @user.student_assignments
    end
  end
end
