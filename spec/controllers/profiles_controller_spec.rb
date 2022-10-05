require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  before(:each) do
    @profile = Profile.create!({ username: 'mockito' })
  end

  let(:valid_params) do
    { username: 'mau-k1', superuser: false }
  end

  describe 'GET #new' do
    before(:each) do
      get :new
    end

    it 'should be success' do
      expect(assigns(:profile)).to_not eq nil
      expect(assigns(:profile)).to be_a_new(Profile)
    end
  end

  describe 'POST #create' do
    it 'creates a new profile' do
      expect { post :create, params: { profile: valid_params } }.to change(Profile, :count).by(1)
    end

    it 'assigns a newly created profile as @profile' do
      post :create, params: { profile: valid_params }

      expect(assigns(:profile)).to be_a(Profile)
      expect(assigns(:profile)).to be_persisted
    end
  end

  describe 'with invalid params' do
    it 'returns unprocessable entity with bad username params' do
      post :create,
           params: { profile: { username: '?usern4.me' } }, :format => :json

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'create profile with superuser false' do
      post :create,
           params: { profile: { username: 'username123',
                              superuser: true } }

      expect(assigns(:profile)).to have_attributes(superuser: false)
    end
  end
end