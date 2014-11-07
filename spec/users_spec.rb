require 'spec_helper'

describe Jargon::Users do

  let(:client) { Jargon::Client.new(access_token: '123') }

  describe :get do
    context 'with an existing user' do
      it 'should correctly make the request' do
        client.expects(:get).with('/users/1').returns('response')
        expect(client.users(1).get).to eq('response')
      end
    end

    context 'without a user' do
      it 'should throw the correct exception' do
        expect { client.users.get }.to raise_error(Jargon::Exceptions::IdExpected)
      end
    end
  end

  describe :save do
    context 'with an existing user' do
      it 'should correctly make the request' do
        user = {:id => 1, :email => 'user@jargon.com'}
        client.expects(:put).with('/users/1', user).returns('response')
        response = client.users.save(user)
        expect(response).to eq('response')
      end
    end

    context 'with a new user' do
      it 'should correctly make the request' do
        user = {:email => 'user@jargon.com'}
        client.expects(:post).with('/users', user).returns('response')
        response = client.users.save(user)
        expect(response).to eq('response')
      end
    end
  end
end
