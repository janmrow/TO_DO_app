require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
      it "diplay some taks" do
        @task = Task.create task: 'read a book' 
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
end
