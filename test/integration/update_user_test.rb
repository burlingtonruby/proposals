require 'test_helper'

class UpdateUserTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:pete)
    login_user @user
  end

  test 'User edits their profile' do
    visit root_path
    click_link 'Sign In w/ GitHub'
    click_link 'Your Profile'
    click_link 'Edit Profile'

    fill_in 'Name', with: 'Smiles the Cat'
    fill_in 'Bio', with: 'Portia sux'
    fill_in 'Your Website', with: 'http://smilesthecat.com'
    fill_in 'Your GitHub Username', with: 'smilesthecat'
    fill_in 'Your Twitter Handle', with: 'smilesthecat'

    click_button 'Update Profile'

    assert_match 'Profile successfully updated.', page.body

    @user.reload
    assert_equal 'Smiles the Cat', @user.name
    assert_equal 'Portia sux', @user.bio
    assert_equal 'http://smilesthecat.com', @user.website
    assert_equal 'smilesthecat', @user.twitter
    assert_equal 'smilesthecat', @user.github
  end
end
