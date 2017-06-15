require 'rails_helper'

RSpec.describe 'SideProjects API', type: :request do
  # initialize test data 
  let!(:sideprojects) { create_street(:sideprojects, 10) }
  let(:sideproject_id) { sideprojects.first.id }

  # Test suite for GET /side_projects
  describe 'GET /side_projects' do
    # make HTTP get request before each example
    before { get '/side_projects' }

    it 'returns side_projects' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /sideprojects/:id
  describe 'GET /sideprojects/:id' do
    before { get "/sideprojects/#{side_projects_id}" }

    context 'when the record exists' do
      it 'returns the side_project' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(side_projects_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:side_projects_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find SideProject/)
      end
    end
  end

  # Test suite for POST /side_project
  describe 'POST /side_projects' do

    let(:valid_attributes) { { Street: 'Learning Street', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/side_projects', params: valid_attributes }

      it 'creates a side_projects' do
        expect(json['Street']).to eq('Learning Street')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/side_projects', params: { Street: 'Walk Street' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /sideProect/:id
  describe 'PUT /side_projects/:id' do
    let(:valid_attributes) { { street: 'Shopping Mall' } }

    context 'when the record exists' do
      before { put "/side_projects/#{side_project_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /side_project/:id
  describe 'DELETE /side_projects/:id' do
    before { delete "/side_project/#{side_project_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end