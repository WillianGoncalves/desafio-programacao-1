require 'test_helper'

class UploadFilesTest < ActionDispatch::IntegrationTest
  test 'get upload file form and save sales' do
    get new_sale_path
    assert_template 'sales/new'
    assert_difference 'Sale.count', 4 do
      file = fixture_file_upload('files/example_input.tab', 'application/octet-stream')
      post sales_path, params: { file: file }
      follow_redirect!
    end
    assert_template 'sales/index'
    assert_match 'Total', response.body
  end

  test 'get upload file form but does not select a file' do
    get new_sale_path
    assert_template 'sales/new'
    assert_no_difference 'Sale.count' do
      post sales_path, params: { file: nil }
    end
    assert_template 'sales/new'
  end
end
