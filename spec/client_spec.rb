require 'spec_helper'

RSpec.describe Jargon::Client do

  let(:access_token) { '123' }
  let(:base_url) { 'http://localhost:3000' }
  let(:client) do
    Jargon::Client.new(access_token: access_token, base_url: base_url)
  end

  it 'should preserve settings' do
    expect(client.access_token).to eq(access_token)
    expect(client.base_url).to eq(base_url)
  end
end
