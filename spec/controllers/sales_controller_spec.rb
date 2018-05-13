require 'rails_helper'

RSpec.describe SalesController, type: :controller do
  describe 'GET #index' do
    before { create_list(:sale, 5) }
    before { get :index }
    it 'get all sales' do
      expect(assigns(:sales)).to_not be_empty
      expect(assigns(:sales).length).to eq 5
      expect(assigns(:total)).to_not be_nil
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before { get :new }
    it { expect(response).to render_template :new }
  end

  describe 'POST #create' do
    context 'with a valid file' do
      let!(:file) { fixture_file_upload('files/example_input.tab', 'application/octet-stream') }
      before { post :create, params: { file: file } }
      it 'create sales' do
        expect(Sale.count).to eq 4
        expect(response).to redirect_to sales_path
      end
    end

    context 'with an invalid file' do
      let!(:file) { fixture_file_upload('files/example_invalid_input.tab', 'application/octet-stream') }
      before { post :create, params: { file: file } }
      it 'does not create sales' do
        expect(Sale.count).to eq 0
        expect(response).to render_template :new
      end
    end

    context 'with no file' do
      before { post :create, params: { file: nil } }
      it 'does not create sales' do
        expect(Sale.count).to eq 0
        expect(response).to render_template :new
      end
    end
  end
end
