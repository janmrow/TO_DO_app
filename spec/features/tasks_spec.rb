require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
      it "diplay some taks" do
        visit tasks_path
        page.should have_content 'read a book'
      end
  end
end
