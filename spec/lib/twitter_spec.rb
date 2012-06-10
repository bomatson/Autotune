require 'spec_helper'

describe "Twitter" do
  let(:user) { Twitter.user('JakeHoffner')}
  let(:timeline) {Twitter.user_timeline('JakeHoffner') }

  describe 'timeline' do
    it "should return most recent tweet" do
      timeline.should_not be_nil
      timeline.first.should_not be_nil
    end


  end
end

