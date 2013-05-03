require "spec_helper"

describe "users/new" do
  let(:user) do
    mock_model("User").as_new_record
  end

  before do
    assign(:user, user)
  end

  it "renders a form to create user" do
    render
    expect(rendered).to have_selector("form",
      :method => "post",
      :action => users_path
    ) do |form|
      expect(form).to have_selector("input", :type => "submit")
    end
  end

  it "renders a text field for the user name" do
    user.stub(:username => "p-baleine")
    render
    expect(rendered).to have_selector("form") do |form|
      expect(form).to have_selector("input",
        :type => "text",
        :name => "user[username]",
        :value => "p-baleine"
      )
    end
  end

  it "renders a password field for the user password" do
    render
    expect(rendered).to have_selector("input",
      :type => "password",
      :name => "user[password]"
    )
  end
end
