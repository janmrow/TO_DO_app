require 'rails_helper'

RSpec.describe "Tasks", type: :request do

  before do
    @task = Task.create task: 'read a book' 
  end

  describe "GET /tasks" do
      it "diplay some taks" do
        visit tasks_path
        page.should have_content 'read a book'
      end

      it "creates a new tas" do
        visit tasks_path
        fill_in 'Task', with: 'walk with dog'
        click_button 'Create'

        current_path == tasks_path
        page.should have_content 'walk with dog'
      end
  end

  describe "PUT /tasks" do 
    it "edit a task" do
      visit tasks_path
      click_link 'Edit'

      current_path.should == edit_task_path(@task)

      expect(page).to have_selector("input[value='read a book']")  
      fill_in 'Task', with: 'updated task'
      click_button 'Update Task'

      current_path.should == tasks_path
      page.should have_content 'updated task'
    end

    it "should not update an empty task" do
      visit tasks_path
      click_link 'Edit'

      fill_in 'Task', with: ''
      click_button 'Update Task'

      current_path.should == edit_task_path(@task)
      expect(page).to have_content 'There was an error.'
    end
  end

  describe "DELETE /tasks" do
    it "should delete a task" do 
      visit tasks_path
      click_link 'Delete'

      expect(page).to have_content 'Task deleted.'
      expect(page).to have_no_content 'read a book'
    end
  end
end
