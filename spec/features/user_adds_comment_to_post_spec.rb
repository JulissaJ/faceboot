require 'spec_helper'

feature 'user can add a comment to a post', %Q{
  As an authorized user
  I want to comment on a friend's post
  so I can create a conversation
} do

  scenario 'successfully adds a comment' do
    post = FactoryGirl.create(:post)
    prev_count = Comment.count
    visit post_path(post)
    click_link 'Add Comment'
    fill_in 'Comment', with: 'Wow, that happened to me too!'
    click_on 'Add Comment'

    expect(page).to have_content 'Comment was successfully added'
    expect(Comment.count).to eq(prev_count + 1)
  end

end
