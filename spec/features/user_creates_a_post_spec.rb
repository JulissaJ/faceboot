require 'spec_helper'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

feature 'user adds a post to their wall', %Q{As a user
  I want to make a post
  so I can share with others
  } do

    context 'as authenticated user' do

      let(:user){ FactoryGirl.create(:user) }
      let(:post){ FactoryGirl.create(:post) }

      before :each do
        sign_in_as(user)
      end


    scenario 'successfully adds a posting' do
      prev_count = Post.count
      visit posts_path
      fill_in 'Add a post', with: "Today at LaunchAcademy I learned how to do all these cool things"

      click_on 'Create Post'

      expect(page).to have_content 'Post was successfully added'
      expect(page).to have_content 'Today at LaunchAcademy'
      expect(Post.count).to eq(prev_count + 1)
    end

    scenario 'with invalid attributes' do
      visit posts_path
      fill_in 'Add a post', with: ''

      click_on 'Create Post'
      expect(page).to have_content 'Post can\'t be blank'
    end
  end


end
