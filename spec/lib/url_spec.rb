require 'spec_helper'

describe GitSnatch::Url do
  let(:instance) { described_class.new(repo, sha, location) }
  let(:repo) { 'random_project' }
  let(:sha) { '214e301aef' }
  let(:location) { 'readme.md' }

  describe '#full' do
    subject { instance.full }

    context 'github' do
      let(:expected_url) do
        %Q{http://raw.github.com/ChuckJHardy/random_project/214e301aef/readme.md}
      end

      before do
        GitSnatch.configuration.username = 'ChuckJHardy'
      end

      it 'returns full url' do
        expect(subject).to eq(expected_url)
      end
    end

    context 'github enterprise' do
      let(:expected_url) do
        %Q{https://github.company.com/organisation/random_project/raw/214e301aef/readme.md}
      end

      before do
        GitSnatch.configuration.endpoint = 'https://github.company.com/organisation'
      end

      it 'returns full url' do
        expect(subject).to eq(expected_url)
      end
    end
  end
end
