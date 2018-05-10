# frozen_string_literal: true
RSpec.describe FileService, type: :service do
  describe 'extract sales' do
    context 'from a valid file' do
      let(:file) { fixture_file_upload('files/example_input.tab', 'application/octet-stream') }
      it { expect(FileService.instance.extract_sales(file)).to be_an Array }
    end

    context 'from a invalid file' do
      it { expect { FileService.instance.extract_sales(nil) }.to raise_error StandardError }
    end
  end
end
