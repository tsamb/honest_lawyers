require_relative '../spec_helper'

feature 'Creating a new matter' do
  before {
    user = User.create(name: "something or other", email: 'foo@foo.net', password: 'password', password_confirmation: 'password')
    visit new_user_matter_path(user)
     }

  it "should have a form" do
    page.should have_css("form")
  end

  it "submitting a form with new_client filled in should create a client and create a matter associated with that client" do
    expect {
      fill_in 'new_client', with: 'foohead'
      fill_in "matter[description]", with:"asdf"
      click_button "Create Matter"

    }.to change { Client.all.count }.by(1)

    expect(Client.last.name).to eq "foohead"
    expect(Matter.last.client).to eq Client.last
  end

  # it "submitting a form with existing client selected should create a matter" do
  #   option = find(:xpath, "//*[@id='client_client_id']/option[2]")
  #   select(option, :from => "client_client_id")
  # end
end

feature "Matter page" do
  before {
    @user = User.create(name: "something or other", email: 'foo@foo.net', password: 'password', password_confirmation: 'password')
  }

  it "should have a 'close matter' link for open matter" do

    matter = @user.matters.create(description: "This matter matters",
                                number: 10000,
                                open: true,
                                client: Client.create(name: 'idiot'))
    visit matter_path(matter)

    page.should have_link("Close Matter")
  end

  it "should indicate matter is closed if matter is closed" do
    matter = @user.matters.create(description: "This matter matters",
                                number: 10000,
                                open: false,
                                client: Client.create(name: 'idiot'))
    visit matter_path(matter)

    page.should have_content("Matter is CLOSED")
  end

  it "should display tasks completed in matter" do
    matter = @user.matters.create(description: "This matter matters",
                                number: 10000,
                                open: true,
                                client: Client.create(name: 'idiot'))

    start_time = Time.now - 1.hour
    end_time = Time.now
    task1 = matter.tasks.create(description: "task foo",
                                start_time: start_time,
                                end_time: end_time)

    task2 = matter.tasks.create(description: "task boo",
                                start_time: start_time - 1.hour,
                                end_time: start_time)

    visit matter_path(matter)

    page.should have_content("task foo")
    page.should have_content(task1.start_time)
    page.should have_content(task1.end_time)
    page.should have_content("Time units: 10")
    page.should have_content("task boo")
    page.should have_content(task2.start_time)
    page.should have_content(task2.end_time)
    page.should have_content("Total Time: 2 hours, 0 minutes")
  end

  it "should display 'pending' for task not yet finished" do
    matter = @user.matters.create(description: "This matter matters",
                                number: 10000,
                                open: true,
                                client: Client.create(name: 'idiot'))


    start_time = Time.now - 1.hour

    task1 = matter.tasks.create(description: "task foo",
                                start_time: start_time)
    visit matter_path(matter)
    page.should have_content('pending')
  end

  it "should display nothing about tasks if no tasks" do
     matter = @user.matters.create(description: "This matter matters",
                                number: 10000,
                                open: true,
                                client: Client.create(name: 'idiot'))
     visit matter_path(matter)
     page.should_not have_content("TASKS")
   end

  #  it "clicking close matter should close matter" do
  #   matter = @user.matters.create(description: "This matter matters",
  #                               number: 10000,
  #                               open: true,
  #                               client: Client.create(name: 'idiot'))
  #    visit matter_path(matter)
  #   # expect {  }
  #   click_link "Close Matter"
  #   matter.open.should be_false
  #   # .to change { matter.open }.from(true).to(false)
  # end

end
