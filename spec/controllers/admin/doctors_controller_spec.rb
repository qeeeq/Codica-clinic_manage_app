require 'rails_helper'

# RSpec.describe "Sessions" do
RSpec.describe DoctorsController, :type => :controller do
  it "signs user in and out" do
    # user = create(:user)    ## for Factory
    user = Doctor.create(phone: '2123123123', password: '123123')
    sign_in user
    get root_path
    expect(response).to render_template(:index)
    
    sign_out user
    get root_path
    expect(response).not_to render_template(:index)
  end
end
