require 'spec_helper'

describe User do
  it { should have_valid(:username).when("Johnny Rotten") }
  it { should_not have_valid(:username).when(nil, '') }

  it { should have_valid(:username).when("Vandango") }
  it { should_not have_valid(:username).when(nil, '') }

  it {should have_valid(:bio).when("I love me") }
  it {should_not have_valid(:bio).when(nil, '') }

  it {should have_valid(:bootcamp).when("Launch Academy") }
  it {should_not have_valid(:bootcamp).when(nil, '') }

  it { should have_many (:posts) }
  it { should have_many(:comments) }




end


