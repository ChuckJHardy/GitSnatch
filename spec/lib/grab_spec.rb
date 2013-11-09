require 'spec_helper'

describe GitSnatch::Grab do
  let(:instance) { described_class.new(repo, sha, location) }
  let(:repo) { 'random_project' }
  let(:sha) { '214e301aef' }
  let(:location) { 'readme.md' }

  describe '#content' do
    subject { instance.content }

    let(:body) { 'Test Response' }
    let(:request) do
      double(
        'GitSnatch::Request',
        body: body
      )
    end

    it 'returns the body of the request' do
      GitSnatch::Request.should_receive(:new).
        with(an_instance_of(String)).
        and_return(request)

      expect(subject).to eq(body)
    end
  end

  describe '#request' do
    subject { instance.request }

    it 'returns an instance of Request' do
      expect(subject).to be_an_instance_of(GitSnatch::Request)
    end
  end
end
