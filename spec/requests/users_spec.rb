require 'rails_helper'

RSpec.describe 'Posts request', type: :request do
  it 'get /users/2/posts status should be 200' do
    get '/users/2'
    expect(response.status).to be(200)
  end

  it 'get users/2 should render users/show template' do
    get '/users/2'
    expect(response).to render_template 'users/show'
    expect(response.body).to include('Here is a list of posts for a given user')
  end

  it 'get users should render users/index template' do
    get '/users'
    expect(response).to render_template 'users/index'
    expect(response.body).to include('Here is a list of posts for a given user')
  end
end
