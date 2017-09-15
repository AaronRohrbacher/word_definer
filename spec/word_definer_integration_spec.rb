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
  end
end

describe('the path to a word with definitions', {:type => :feature}) do
  it('adds inputted definition to specific word') do
    visit('/define/1')
    fill_in('definition_input', :with => '123')
    click_button('Submit')
    expect(page).to have_content('123')
  end
end

describe('path to add word and definition, specific to each word', {:type => :feature}) do
  before() do
    Word.clear
    Define.clear
  end
  it('shows a definition for specific words only') do
    visit('/')
    fill_in('word_input', :with => 'abc')
    click_button('Submit')

    fill_in('word_input', :with => 'def')
    click_button('Submit')

    click_link('abc')

    fill_in('definition_input', :with => '123')
    click_button('Submit')

    expect(page).to have_content('123')
  end
end
