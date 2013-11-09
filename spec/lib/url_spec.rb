require 'spec_helper'

describe GitSnatch::Url do
  let(:instance) { described_class.new(repo, sha, file) }
  let(:repo) { 'random_project' }
  let(:sha) { '214e301aef' }
  let(:file) { 'readme.md' }

  describe '#full' do
    subject { instance.full }

    let(:expected_url) do
      %Q{http://www.github.com/random_project/raw/214e301aef/readme.md}
    end

    it 'returns full url' do
      expect(subject).to eq(expected_url)
    end
  end
end
