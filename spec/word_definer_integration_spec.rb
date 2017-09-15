require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the path to a list of words', {:type => :feature}) do
  it('processes input and displays a list of words') do
    visit('/')
    fill_in('word_input', :with => 'abc')
    click_button('Submit')

    expect(page).to have_content('abc')
    save_and_open_page
    end
  end
