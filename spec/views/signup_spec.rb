require_relative '../spec_helper'

describe 'users/new.html.erb' do

  it 'should be successful' do
    visit new_user_path # not sure if this is the right path, but whatever
    response.should be_success
  end

  it 'should have form' do
    get new_user_path

    page.should have_css('form')
  end
end
