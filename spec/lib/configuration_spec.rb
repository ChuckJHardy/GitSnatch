require 'spec_helper'

describe GitSnatch::Configuration do
  let(:instance) { described_class.new }

  describe '.configuration' do
    subject { Class.new { extend GitSnatch::Configure }.configuration }

    it 'returns a configuration instance' do
      expect(subject).to be_an_instance_of(GitSnatch::Configuration)
    end
  end

  describe '.configure' do
    subject { Class.new { extend GitSnatch::Configure } }

    let(:new_endpoint) { 'http://github.company.com/organisation' }

    it 'yields the current configuration' do
      expect { |b| subject.configure(&b) }.to yield_control
    end

    it 'returns the altered configuration' do
      expect(
        subject.configure { |c| c.endpoint = new_endpoint }
      ).to be_an_instance_of(GitSnatch::Configuration)

      expect(subject.configuration.endpoint).to eql(new_endpoint)
    end
  end

  describe "#endpoint" do
    subject { instance.endpoint }

    let(:default) { 'http://www.github.com' }
    let(:new) { 'http://github.company.com/organisation' }

    it "returns a string" do
      expect(subject).to be_an_instance_of(String)
    end

    it 'returns default' do
      expect(subject).to eq(default)
    end

    it 'returns altered' do
      instance.endpoint = new
      expect(subject).to eq(new)
    end
  end

  describe "#username" do
    subject { instance.username }

    let(:default) { nil }
    let(:new) { 'john-smith' }

    it 'returns default' do
      expect(subject).to eq(default)
    end

    it 'returns altered' do
      instance.username = new
      expect(subject).to eq(new)
    end
  end

  describe "#password" do
    subject { instance.password }

    let(:default) { nil }
    let(:new) { '123456' }

    it 'returns default' do
      expect(subject).to eq(default)
    end

    it 'returns altered' do
      instance.password = new
      expect(subject).to eq(new)
    end
  end
end
