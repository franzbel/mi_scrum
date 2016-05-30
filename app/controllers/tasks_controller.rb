class TasksController < ApplicationController
  def create
    # render :text => params
    user_story = UserStory.find(params[:task][:user_story_id])
    @task = user_story.tasks.new(task_params)
    respond_to do |format|
      if @task.save
        format.js{}
      end
    end
  end

  def update
    # render :text => params
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.js{}
      end
    end
  end
  private
  def task_params
    params.require(:task).permit(:title, :task)
  end
end
