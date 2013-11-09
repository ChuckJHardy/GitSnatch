require 'spec_helper'

describe GitSnatch, :vcr do
  let(:instance) { described_class.new(repo, sha) }
  let(:repo) { 'www' }
  let(:sha) { '38209a615b72728ef4f3160619c7c63c37b8994c' }

  let(:endpoint) { 'https://github.company.com/organisation' }
  let(:username) { 'john.smith' }
  let(:password) { '123456' }

  before do
    GitSnatch.configuration.endpoint = endpoint
    GitSnatch.configuration.username = username
    GitSnatch.configuration.password = password
  end

  describe '.within' do
    subject { described_class.within(repo, sha) }

    it 'returns an instance of GitSnatch' do
      expect(subject).to be_an_instance_of(GitSnatch)
    end
  end

  describe '#grab' do
    subject { instance.grab(file) }

    let(:file) { 'continuus_lenimentus.enc' }
    let(:response) do
      %Q{{:created_at=>2013-11-08 15:34:11 +0000, :duration=>24.311842, :counts=>{:example=>2304, :failure=>3, :pending=>5}, :metrics=>{:total_lines=>7865, :coverage=>{:percent=>79.83471074380165, :strength=>6.315066751430388, :lines=>6279}}}\n}
    end

    it 'returns content for request' do
      expect(subject).to eq(response)
    end
  end
end
