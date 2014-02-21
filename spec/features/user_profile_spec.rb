require_relative '../spec_helper'

feature 'Viewing user profile page' do
  before {
    @user = User.create(name: "something or other", email: 'foo@foo.net', password: 'password', password_confirmation: 'password')
    @client = Client.create(name: 'idiot')
  }

  it "should list matters" do

    matter1 = @user.matters.create(description: 'stuff',
                                   client: @client,
                                   open: true,
                                   number: 333)

    matter2 = @user.matters.create(description: 'foods',
                                   client: @client,
                                   open: false,
                                   number: 222)

    matter3 = @user.matters.create(description: 'things',
                                   client: @client,
                                   open: true,
                                   number: 111)

    visit user_path(@user)

    expect(page).to have_content('Description: stuff')
    expect(page).to have_content('Description: foods')
    expect(page).to have_content('Description: things')
    expect(page).to have_content("Client: #{@client.name}")
    expect(page).to have_content("User: #{@user.name}")
    expect(page).to have_content('Status: Open')
    expect(page).to have_content('Status: Closed')
    expect(page).to have_content("Number: 333")
    expect(page).to have_content("Number: 222")
    expect(page).to have_content("Number: 111")
    expect(page).to have_content("Updated at: #{matter1.updated_at}")
    expect(page).to have_content("Updated at: #{matter2.updated_at}")
    expect(page).to have_content("Updated at: #{matter3.updated_at}")
 end

  it "should have add task link for matter" do
    matter1 = @user.matters.create(description: 'stuff',
                                   client: @client,
                                   open: true,
                                   number: 333)

    visit user_path(@user)

    expect(page).to have_link("Add Task")
  end

  it "clicking add task link should create a task for the matter" do
     matter1 = @user.matters.create(description: 'stuff',
                                   client: @client,
                                   open: true,
                                   number: 333)

     visit user_path(@user)

     expect { click_link("Add Task") }
     .to change(Task, :count).by(1)

     expect(Task.last.matter).to eq matter1
   end

   it "clicking add task link should direct to task edit/show page" do
     matter1 = @user.matters.create(description: 'stuff',
                                   client: @client,
                                   open: true,
                                   number: 333)

     visit user_path(@user)
     click_link("Add Task")
     expect(page).to have_content("Time Started: #{Task.last.start_time}")
     #expect(page).to have_content("Matter: #{matter1.name}")
   end

end
