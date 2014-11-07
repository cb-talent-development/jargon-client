require 'spec_helper'

RSpec.describe Jargon::Locales do

  let(:client) { Jargon::Client.new(access_token: '123') }

  describe :get do
    context 'with an existing locale' do
      it 'should correctly make the request' do
        client.expects(:get).with('/localizations/1/en').returns('response')
        expect(client.localizations(1).get_locale('en')).to eq('response')
      end
    end

    context 'without a localization' do
      it 'should throw the correct exception' do
        expect { client.localizations.get_locale('en') }.to raise_error(Jargon::Exceptions::IdExpected)
      end
    end
  end

  describe :delete do
    context 'with an existing locale' do
      it 'should correctly make the request' do
        client.expects(:delete).with('/localizations/1/en').returns('response')
        expect(client.localizations(1).delete_locale('en')).to eq('response')
      end
    end

    context 'without a localization' do
      it 'should throw the correct exception' do
        expect { client.localizations.delete_locale('en') }.to raise_error(Jargon::Exceptions::IdExpected)
      end
    end
  end

  describe :save do
    context 'with an existing locale' do
      it 'should correctly make the request' do
        locale = {:id => 'en', :locale => 'English'}
        client.expects(:put).with('/localizations/1/en', locale).returns('response')
        expect(client.localizations(1).save_locale(locale)).to eq('response')
      end
    end

    context 'with a new locale' do
      it 'should correctly make the request' do
        locale = {:locale => 'English'}
        client.expects(:post).with('/localizations/1/locales', locale).returns('response')
        expect(client.localizations(1).save_locale(locale)).to eq('response')
      end
    end

    context 'without a localization' do
      it 'should throw the correct exception' do
        locale = {:id => 'en', :locale => 'English'}
        expect { client.localizations.save_locale(locale) }.to raise_error(Jargon::Exceptions::IdExpected)
      end
    end
  end
end
