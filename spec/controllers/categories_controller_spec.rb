require 'rails_helper'
RSpec.describe CategoriesController, type: :controller do
  let!(:category) { build(:category) }  # Assumes you have a category factory defined

  describe "GET #index" do
    it "returns a successful response and right template (index)" do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "returns a successful response and right template (show)" do
      get :show, params: { id: category.id }
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
      get :edit, params: { id: category.id }
      expect(response).to be_successful
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_attributes) { { name: "New Category", description: "Category description" } }

      it "creates a new category" do
        expect {
          post :create, params: { category: valid_attributes }
        }.to change(Category, :count).by(1)
      end

      it "redirects to the category index" do
        post :create, params: { category: valid_attributes }
        expect(response).to redirect_to(categories_path)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { name: "", description: "Category description" } }

      it "does not create a new category" do
        expect {
          post :create, params: { category: invalid_attributes }
        }.not_to change(Category, :count)
      end

      it "renders the new template" do
        post :create, params: { category: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      let(:new_attributes) { { name: "Updated Category", description: "Updated description" } }

      it "updates the requested category" do
        patch :update, params: { id: category.id, category: new_attributes }
        category.reload
        expect(category.name).to eq("Updated Category")
      end

      it "redirects to the category show page" do
        patch :update, params: { id: category.id, category: new_attributes }
        expect(response).to redirect_to(category_path(category))
      end
    end

    context "with invalid parameters" do
      it "renders the edit template" do
        patch :update, params: { id: category.id, category: { name: "" } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested category" do
      category_to_destroy = create(:category, name: "Ruby on Rails")
      expect {
        delete :destroy, params: { id: category_to_destroy.id }
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the category index" do
      delete :destroy, params: { id: category.id }
      expect(response).to redirect_to(categories_path)
    end
  end
end
