require 'spec_helper'

describe Post do
  it { should have_valid(:title).when('This was my day...')}
  it { should_not have_valid(:title).when(nil, '') }

  it { should have_valid(:content).when('Wow, so today I learned')}
  it { should_not have_valid(:content).when(nil,'') }


end
