require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe IssuesController, type: :controller do

  let(:project){ FactoryGirl.create(:project) }
  let(:creator){ FactoryGirl.create(:user) }
  before{ devise_user_login(user) }

  let(:issue){ FactoryGirl.create(:issue, project: project, creator: creator) }

  # This should return the minimal set of attributes required to create a valid
  # Issue. As you add validations to Issue, be sure to
  # adjust the attributes here as well.
  let(:valid_parameters) {
    FactoryGirl.attributes_for(:issue).merge(project_id: project.id, creator_id: creator.id)
  }

  let(:invalid_parameters) {
    valid_parameters.symbolize_keys.merge(title: '')
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IssuesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all issues as @issues" do
      get :index, params: {}, session: valid_session
      expect(assigns(:issues)).to eq([issue])
    end
  end

  describe "GET #show" do
    it "assigns the requested issue as @issue" do
      issue # To create issue
      get :show, params: {:id => issue.to_param}, session: valid_session
      expect(assigns(:issue)).to eq(issue)
    end
  end

  describe "GET #new" do
    it "assigns a new issue as @issue" do
      get :new, params: {}, session: valid_session
      expect(assigns(:issue)).to be_a_new(Issue)
    end
  end

  describe "GET #edit" do
    it "assigns the requested issue as @issue" do
      issue # To create issue
      get :edit, params: {:id => issue.to_param}, session: valid_session
      expect(assigns(:issue)).to eq(issue)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Issue" do
        expect {
          post :create, params: {:issue => valid_parameters}, session: valid_session
        }.to change(Issue, :count).by(1)
      end

      it "assigns a newly created issue as @issue" do
        post :create, params: {:issue => valid_parameters}, session: valid_session
        expect(assigns(:issue)).to be_a(Issue)
        expect(assigns(:issue)).to be_persisted
      end

      it "redirects to the created issue" do
        post :create, params: {:issue => valid_parameters}, session: valid_session
        expect(response).to redirect_to(Issue.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved issue as @issue" do
        post :create, params: {:issue => invalid_parameters}, session: valid_session
        expect(assigns(:issue)).to be_a_new(Issue)
      end

      it "re-renders the 'new' template" do
        post :create, params: {:issue => invalid_parameters}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_title){ valid_parameters[:title].succ }
      let(:new_status){ valid_parameters[:status].succ }

      let(:new_parameters) {
        valid_parameters.merge(title: new_title, status: new_status)
      }

      it "updates the requested issue" do
        issue # To create issue
        put :update, params: {:id => issue.to_param, :issue => new_parameters}, session: valid_session
        issue.reload
        expect(issue.title).to eq new_title
        expect(issue.status).to eq new_status
      end

      it "assigns the requested issue as @issue" do
        issue # To create issue
        put :update, params: {:id => issue.to_param, :issue => valid_parameters}, session: valid_session
        expect(assigns(:issue)).to eq(issue)
      end

      it "redirects to the issue" do
        issue # To create issue
        put :update, params: {:id => issue.to_param, :issue => valid_parameters}, session: valid_session
        expect(response).to redirect_to(issue)
      end
    end

    context "with invalid params" do
      it "assigns the issue as @issue" do
        issue # To create issue
        put :update, params: {:id => issue.to_param, :issue => invalid_parameters}, session: valid_session
        expect(assigns(:issue)).to eq(issue)
      end

      it "re-renders the 'edit' template" do
        issue # To create issue
        put :update, params: {:id => issue.to_param, :issue => invalid_parameters}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested issue" do
      issue # To create issue
      expect {
        delete :destroy, params: {:id => issue.to_param}, session: valid_session
      }.to change(Issue, :count).by(-1)
    end

    it "redirects to the issues list" do
      issue # To create issue
      delete :destroy, params: {:id => issue.to_param}, session: valid_session
      expect(response).to redirect_to(issues_url)
    end
  end

end
