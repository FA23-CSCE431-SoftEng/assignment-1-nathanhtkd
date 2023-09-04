# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe "Creating a book", type: :feature do
    # scenario 'valid inputs' do
    #     visit new_book_path
    #     fill_in "book[title]", with: 'harry potter'
    #     fill_in "book[author]", with: 'J.K. Rowling'
    #     fill_in "book[price]", with: '10.99'
    #     fill_in "book[published]", with: '1997-06-26'
    #     click_on 'Create Book'
    #     visit books_path
    #     expect(page).to have_content('harry potter')
    #     expect(page).to have_content('J.K. Rowling')
    #     expect(page).to have_content('$10.99')
    #     expect(page).to have_content('1997-06-26')
    # end


    # SUNNY TEST 
    scenario 'successfully creates a book' do
        visit new_book_path
        fill_in 'book[title]', with: 'harry potter'
        click_on 'Create Book'
        
        expect(page).to have_content('Book was successfully created.') # FLASH NOTICE
        expect(Book.count).to eq(1)
    end


    # RAINY TEST - blank title
    scenario 'does not save a book with blank title' do
        visit new_book_path
        fill_in 'book[title]', with: ''
        click_on 'Create Book'
        
        expect(page).to have_content("Title can't be blank") # FLASH NOTICE
        expect(Book.count).to eq(0)
    end
end
