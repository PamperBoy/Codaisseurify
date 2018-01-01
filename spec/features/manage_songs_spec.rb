require 'rails_helper'

feature 'Manage songs', js: true do
  scenario 'add a new song' do

    visit "http://localhost:3000/artists/1"

    fill_in 'song_name', with: 'Awesome song name'

    page.execute_script("$('form').submit()")

    expect(page).to have_content('Awesome song name')
  end

  scenario 'delete a song' do
    visit "http://localhost:3000/artists/1"

    id = find('td', text: "Awesome song name").find(:xpath, '..')['data-id']
    find(:css, "#song-#{id}").click

    expect(page).to have_no_content("song-#{id}")

  end

  scenario 'deletes all songs' do
    visit "http://localhost:3000/artists/1"

    1..5.times do
      fill_in 'song_name', with: 'Awesome song name'
      page.execute_script("$('form').submit()")
    end

    find(:css, "#delete-all-songs").click
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content(["data-id"], count: 0)

  end
end
