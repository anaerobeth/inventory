require 'spec_helper'

feature 'receive inventory' , %Q{
  As a food service employee
  I want to receive inventory
  So that it can be recorded that we have food items
  } do

  # Acceptance Criteria:

  # * I must specify a title, description, and quantity of the food item
  # * If I do not specify the required information,
  #   I am prompted to fix errors and to resubmit
  # * If I specify the required information, my inventory entry is recorded.

  scenario 'user provides required information' do
    prev_count = Receipt.count

    visit new_receipt_path
    fill_in 'Title', with: 'Burrito'
    fill_in 'Description', with: 'Spicy'
    fill_in 'Quantity', with: 100
    click_button 'Receive'

    expect(page).to have_content('Receipt was successfully created')
    expect(Receipt.count).to eql(prev_count + 1)
  end

  scenario 'user does not provide required information' do
    prev_count = Receipt.count

    visit new_receipt_path
    click_button 'Receive'

    expect(page).to_not have_content('Receipt was successfully created')
    expect(Receipt.count).to eql(prev_count)
  end

end