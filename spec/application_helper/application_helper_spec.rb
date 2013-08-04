require "spec_helper"

class TestClass
    include ApplicationHelper
end

describe ApplicationHelper do

    describe "email_hash" do
        it "responses as class method" do
            TestClass.new.should respond_to(:email_hash)
        end
        it "returns string" do
            TestClass.new.email_hash('test@test.com').should be_kind_of(String)
        end
    end
end

