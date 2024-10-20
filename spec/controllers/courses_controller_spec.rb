require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let!(:course) { create(:course) }
  describe "GET #index" do
    it "returns a successful response and right template (index)" do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "returns a successful response and right template (show)" do
      get :show, params: { id: course.id }
      expect(response).to be_successful
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "returns a successful response and right template (new)" do
      get :new
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "returns a successful response and right template (edit)" do
      get :edit, params: { id: course.id }
      expect(response).to be_successful
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    let!(:user) { create(:user) } # Create the user in the database
    let!(:category) { create(:category, name: "RoR") } # Ensure the category is created too

    before do
      # Mock the current_user method to return the logged-in user
      allow(controller).to receive(:current_user).and_return(user)
    end

    context "with valid parameters" do
      let(:valid_attributes) {
        {
          title: "New Ruby Course",
          description: "Course description",
          teacher_id: user.id, # Ensure this is set correctly
          category_id: category.id,
          price: 100.0,
          level: "beginner",
          language: "English",
          duration: "10"
        }
      }

      it "creates a new course" do
        expect {
          post :create, params: { course: valid_attributes }
        }.to change(Course, :count).by(1)
      end

      it "redirects to the course index" do
        post :create, params: { course: valid_attributes }
        expect(response).to redirect_to(courses_path)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { title: "", description: "Course description" } }

      it "does not create a new course" do
        expect {
          post :create, params: { course: invalid_attributes }
        }.not_to change(Course, :count)
      end

      it "renders the new template" do
        post :create, params: { course: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end


  describe "PATCH #update" do
    context "with valid parameters" do
      let(:new_attributes) { { title: "Updated Course", description: "Updated description" } }

      it "updates the requested course" do
        patch :update, params: { id: course.id, course: new_attributes }
        course.reload
        expect(course.title).to eq("Updated Course")
      end

      it "redirects to the course show page" do
        patch :update, params: { id: course.id, course: new_attributes }
        expect(response).to redirect_to(course_path(course))
      end
    end

    context "with invalid parameters" do
      it "renders the edit template" do
        patch :update, params: { id: course.id, course: { title: "" } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested course" do
      course_to_destroy = create(:course)
      expect {
        delete :destroy, params: { id: course_to_destroy.id }
      }.to change(Course, :count).by(-1)
    end

    it "redirects to the course index" do
      delete :destroy, params: { id: course.id }
      expect(response).to redirect_to(courses_path)
    end
  end
end
