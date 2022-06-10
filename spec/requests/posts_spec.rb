require 'rails_helper'

RSpec.describe 'Posts request', type: :request do
  it 'get /users/2/posts status should be 304' do
    get '/users/2/posts/1'
    expect(response.status).to be(200)
  end

  it 'get users/2/posts should render posts/index template' do
    get '/users/2/posts'
    expect(response).to render_template 'posts/index'
    expect(response.body).to include('Here is a list of posts for a given user')
  end

  it 'get users/2/posts/1 should render posts/show template' do
    get '/users/2/posts/1'
    expect(response).to render_template 'posts/show'
    expect(response.body).to include('Here is a list of posts for a given user')
  end
end
