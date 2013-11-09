require 'spec_helper'

describe GitSnatch::Curler do
  let(:instance) { described_class.new(curl) }
  let(:curl) { double('Curl::Easy') }

  describe '#build' do
    subject { instance.build }

    let(:auth) { :basic }
    let(:username) { 'john-smith' }
    let(:password) { '123456' }

    it 'returns curl object' do
      expect(subject).to eq(curl)
    end

    context 'configures curl' do
      before do
        GitSnatch.configuration.username = username
        GitSnatch.configuration.password = password
      end

      it 'with auth, username and password' do
        curl.should_receive(:http_auth_types=).with(auth)
        curl.should_receive(:username=).with(username)
        curl.should_receive(:password=).with(password)

        subject
      end
    end
  end
end
