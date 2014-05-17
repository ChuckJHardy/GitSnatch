require 'spec_helper'

describe GitSnatch::Request do
  let(:instance) { described_class.new(url) }

  let(:url) { GitSnatch::Url.new(repo, sha, file).full }
  let(:repo) { 'random_project' }
  let(:sha) { '214e301aef' }
  let(:file) { 'readme.md' }
  
  describe '#body' do
    subject { instance.body }

    let(:body) { 'Test Response' }
    let(:curl) do
      double(
        'Curl::Easy',
        perform: double,
        body_str: body
      )
    end
    
    it 'returns reponse body from request' do
      Curl::Easy.should_receive(:new).with(url).and_return(curl)
      expect(subject).to eq(body)
    end
  end
end
