require 'spec_helper'

describe Post do


  it { should have_valid(:content).when('Wow, so today I learned')}
  it { should_not have_valid(:content).when(nil,'') }


end
