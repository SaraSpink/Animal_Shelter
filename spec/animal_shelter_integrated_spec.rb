require ('capybara/rspec')
require ('./app')
Capybara.app = Sinatra::Application
set(:Show_exception, false)

describe('adding a new pet', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    visit('/')
    click_link('View all adoptable animals')
    fill_in('name', :with => 'Dixie')
    click_button('Add this pet!')
    expect(page).to have_content('Dixie')
  end
end
