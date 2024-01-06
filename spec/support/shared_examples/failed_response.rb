RSpec.shared_examples 'failed response' do
  let(:status_code) { :not_found }
  let(:expected_keys) { %i[message] }
  let(:error_message) { I18n.t('errors.not_fount', model: Product.to_s) }

  it 'returns a failed status code' do
    expect(response).to have_http_status(status_code)
  end

  it 'returns a correr error message' do
    expect(response_body['message']).to eq(error_message)
  end

  it 'contains expected keys in the response body' do
    expect(response_body.keys.map(&:to_sym)).to eq(expected_keys)
  end
end
