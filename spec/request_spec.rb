require 'spec_helper'

describe Jargon::Request do
  let(:client) { Jargon::Client.new(access_token: '123') }

  context 'Request Methods' do
    let(:response) { OpenStruct.new({body: 'Body', headers: {}, status: 200} ) }
    let(:model) { { title: 'Test' } }

    before(:each) do
      @connection = stub
      Jargon::Client.any_instance.stubs(:connection).returns(@connection)
      Jargon::Result.any_instance.stubs(:new).with(response).returns(true)
    end

    describe '#get' do
      it 'should call get' do
        @connection.stubs(:get).returns(response).once
        expect(client.get('/test/')).to be_truthy
      end
    end

    describe '#post' do
      it 'should call post' do
        @connection.stubs(:post).returns(response).once
        expect(client.post('/test/')).to be_truthy
      end
    end

    describe '#put' do
      it 'should call put' do
        @connection.stubs(:put).returns(response).once
        expect(client.put('/test/')).to be_truthy
      end
    end

    describe '#delete' do
      it 'should call delete' do
        @connection.stubs(:delete).returns(response).once
        expect(client.delete('/test/')).to be_truthy
      end
    end

    describe '#save' do
      it 'should post when new' do
        @connection.stubs(:post).returns(response).once
        expect(client.save('/test/', model)).to be_truthy
      end

      it 'should put when updating' do
        update = model
        update[:id] = 1
        @connection.stubs(:put).returns(response).once
        expect(client.save('/test/', update)).to be_truthy
      end
    end
  end

  context 'Record Parsing' do
    let(:body) { 'Body' }
    let(:headers) { { } }
    let(:status) { 200 }
    let(:error_status) { 400 }
    let(:response) { OpenStruct.new({body: 'Body', headers: {}, status: 200 } ) }

    describe 'parse_response' do
      before(:each) do
        result = stub
        Jargon::Result.any_instance.stubs(:new).with(body, headers, status).returns(true)
        Jargon::Result.any_instance.stubs(:new).with(body, headers, error_status).returns(true)
      end

      it 'should construct a successful response' do
        expect(client.parse_response(response)).to be_truthy
      end

      it 'should construct an error response' do
        error = response
        error.status = error_status
        expect(client.parse_response(error)).to be_truthy
      end
    end
  end
end
