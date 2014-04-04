require 'spec_helper'

feature 'user adds a post to their wall', %Q{As a user
  I want to make a post
  so I can share with others
  } do


  scenario 'successfully adds a posting' do
    prev_count = Post.count
    visit new_post_path
    fill_in 'Title', with: 'My Day Today'
    fill_in 'Content', with: "Today at LaunchAcademy I learned how to do all these cool things"

    click_on 'Submit Post'

    expect(page).to have_content 'Post was successfully added'
    expect(page).to have_content 'Today at LaunchAcademy'
    expect(Post.count).to eq(prev_count + 1)
  end

  scenario 'with invalid attributes' do
    visit new_post_path
    fill_in 'Title', with: ''
    fill_in 'Content', with: ''

    click_on 'Submit Post'
    expect(page).to have_content 'Post or title can\'t be blank'
  end


end
