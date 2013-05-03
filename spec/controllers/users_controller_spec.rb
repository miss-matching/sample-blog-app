require 'spec_helper'

describe UsersController do
  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template "new"
    end

    it "assigns @user" do
      get :new
      expect(assigns[:user]).to be_a_kind_of(User)
    end
  end

  describe "POST create" do
    let(:user) do
      mock_model(User).as_null_object
    end

    before do
      User.stub(:new).and_return(user)
    end

    it "creates a new user" do
      User.should_receive(:new).
        with("username" => "p-baleine").
        and_return(user)
      post :create, :user => { "username" => "p-baleine" }
    end

    it "saves the user" do
      user.should_receive(:save)
      post :create
    end

    context "when the user saves successfully" do
      before do
        user.stub(:save).and_return(true)
      end

      it "sets a flash[:notice] message" do
        post :create
        expect(flash[:notice]).to eq("Account was created successfuly.")
      end

      it "redirects to root" do
        post :create
        expect(response).to redirect_to root_path
      end
    end

    context "when the user fails to save" do
      before do
        user.stub(:save).and_return(false)
      end

      it "assigns @user" do
        post :create
        expect(assigns[:user]).to eq(user)
      end

      it "renders the new template" do
        post :create
        expect(response).to render_template("new")
      end
    end
  end
end
