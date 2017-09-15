require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the path to a list of words', {:type => :feature}) do
  it('displays a list of inputted words') do
    visit('/')
    fill_in('word', :with => 'Concatenate')
    click_button('submit')
    expect(page).to have_content('Concatenate')
  end
end
