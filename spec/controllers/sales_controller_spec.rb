require 'rails_helper'

RSpec.describe SalesController, type: :controller do
  describe 'GET #index' do
    before { create_list(:sale, 5) }
    before { get :index }
    it { expect(assigns(:sales)).to_not be_empty }
    it { expect(assigns(:sales).length).to eq 5 }
    it { expect(response).to render_template :index }
  end

  describe 'GET #new' do
    before { get :new }
    it { expect(response).to render_template :new }
  end

  describe 'POST #create' do
    context 'uploading a file' do
      let!(:file) { fixture_file_upload('files/example_input.tab', 'application/octet-stream') }
      before { post :create, params: { file: file } }
      it { expect(Sale.count).to eq 4 }
      it { expect(response).to redirect_to sales_path }
    end

    context 'with no file' do
      before { post :create, params: { file: nil } }
      it { expect(Sale.count).to eq 0 }
      it { expect(response).to render_template :new }
    end
  end
end
