require 'spec_helper'

describe GitSnatch do
  let(:instance) { described_class.new }

  describe '.configuration' do
    subject { described_class.configuration }

    it 'returns a configuration instance' do
      expect(subject).to be_an_instance_of(GitSnatch::Configuration)
    end
  end

  describe '.configure' do
    let(:new_endpoint) { 'http://github.company.com/organisation' }

    it 'yields the current configuration' do
      expect { |b| described_class.configure(&b) }.to yield_control
    end

    it 'returns the altered configuration' do
      expect(
        described_class.configure { |c| c.endpoint = new_endpoint }
      ).to be_an_instance_of(GitSnatch::Configuration)

      expect(described_class.configuration.endpoint).to eql(new_endpoint)
    end
  end
end
