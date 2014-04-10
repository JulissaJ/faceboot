require 'spec_helper'

describe Comment do

  it {should have_valid(:body).when('Cool post!') }
  it {should_not have_valid(:body).when(nil,'') }

  it { should belong_to(:post) }

end
