require 'rails_helper'
require 'external/client'

RSpec.describe ReportsController, type: :controller do
  before(:each) do
    @profile = Profile.create!({ username: 'mockito' })
    @profile_two = Profile.create!({ username: 'mockito-2' })
  end

  before(:each) do
    @repository = Repository.create!({ name: 'mockito repo', tags: 'repo', profile_id: @profile.id })
    @repository_two = Repository.create!({ name: 'mockito repo 2', tags: 'lala', profile_id: @profile_two.id })
  end

  let(:valid_params) do
    { name: 'Test title', director: 'Test', release_date: '01/20/2015', category_id: @category.id,
      status: 1 }
  end

  describe 'GET #index' do
    it 'renders index' do
      get :index, params: {}

      expect(response).to be_successful
      expect(response).to render_template(:index)
    end

    it 'returns all profiles with their repos' do
      get :index, params: {}, :format => :json

      expect(response.body).to include('mockito')
      expect(response.body).to include('mockito-2')
      expect(response.body).to include('mockito repo')
      expect(response.body).to include('mockito repo 2')
    end

    it 'renders filtered profiles' do
      get :index, params: { tag: 'repo'}, :format => :json

      expect(response.body).to include('mockito repo')
      expect(response.body).to_not include('lala')
    end
  end

  describe 'GET #external' do

    it 'renders index' do    
      client = instance_double("::External::Client")
      allow(client).to receive(:fetch_profiles).and_return{[{
        "id": 1,
        "username": "eat-music-4",
        "superuser": false
      },
      {
        "id": 2,
        "username": "leopard-7",
        "superuser": false
      },]}

      get :external, params: {}, :format => :json

      expect(response.body).to include('eat-music-4')
    end
  end
end