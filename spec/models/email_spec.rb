require 'spec_helper'

describe Email do
  describe "EmailProcessor" do
    it "processes an incoming email and creates a bookmark" do
      b = EmailProcessor.process(:email)
    end
  end
end
