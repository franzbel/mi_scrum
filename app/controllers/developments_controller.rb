class DevelopmentsController < ApplicationController
  def information
    @user_story = UserStory.find(params[:id])
    @product = @user_story.product
    @sprint = @user_story.sprint_backlog
    @sprints = @product.sprint_backlogs
    @tasks = @user_story.tasks
  end
end
