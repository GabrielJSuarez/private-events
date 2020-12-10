require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'GET /signup' do
    before { get '/login' }

    it 'should return 200' do
      expect(response).to have_http_status(200)
    end
    it 'should return the login label' do
      expect(response.body).to include('Welcome!, please enter your name!')
      puts headers
    end
  end
end
