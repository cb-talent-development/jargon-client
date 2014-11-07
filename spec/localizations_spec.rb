require 'spec_helper'

RSpec.describe Jargon::Localizations do

  let(:client) { Jargon::Client.new(access_token: '123') }

  describe :get do
    context 'with an existing localization' do
      it 'should correctly make the request' do
        client.expects(:get).with('/localizations/1').returns('response')
        expect(client.localizations(1).get).to eq('response')
      end
    end

    context 'without a localization' do
      it 'should throw the correct exception' do
        expect { client.localizations.get }.to raise_error(Jargon::Exceptions::IdExpected)
      end
    end
  end

  describe :delete do
    context 'with an existing localization' do
      it 'should correctly make the request' do
        client.expects(:delete).with('/localizations/1').returns('response')
        expect(client.localizations(1).delete).to eq('response')
      end
    end

    context 'without a localization' do
      it 'should throw the correct exception' do
        expect { client.localizations.delete }.to raise_error(Jargon::Exceptions::IdExpected)
      end
    end
  end

  describe :save do
    context 'with an existing localization' do
      it 'should correctly make the request' do
        localization = {:id => 1, :name => 'Localization'}
        client.expects(:put).with('/localizations/1', localization).returns('response')
        expect(client.localizations(1).save(localization)).to eq('response')
      end
    end

    context 'with a new localization' do
      it 'should correctly make the request' do
        localization = {:name => 'Localization'}
        client.expects(:post).with('/localizations', localization).returns('response')
        expect(client.localizations.save(localization)).to eq('response')
      end
    end
  end
end
