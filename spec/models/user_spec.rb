require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Saied', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'developer') }
  before { subject }

  it 'name is nil or blank' do
    test_case = subject
    test_case.name = nil
    expect(test_case).to_not be_valid
    test_case.name = ''
    expect(test_case).to_not be_valid
  end
  it 'name is less than length of 3' do
    test_case = subject
    test_case.name = 'sa'
    expect(test_case).to_not be_valid
  end
  it 'name is longer than length of 32' do
    test_case = subject
    test_case.name = 'a' * 45
    expect(test_case).to_not be_valid
  end
  it 'posts counter is greater than or equal zero' do
    test_case = subject
    test_case.posts_counter = -1
    expect(test_case).to_not be_valid
    test_case.posts_counter = 0
    expect(test_case).to be_valid
    test_case.posts_counter = 1
    expect(test_case).to be_valid
  end
  it 'posts counter is not number' do
    test_case = subject
    test_case.posts_counter = 'hi'
    expect(test_case).to_not be_valid
  end
end
