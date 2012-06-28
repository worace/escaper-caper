require 'spec_helper'

describe ParentCategory do
  context "validations" do
    it "requires a name" do
      pc = FactoryGirl.build(:parent_category, name: nil)
      pc.should_not be_valid

      pc = FactoryGirl.build(:parent_category, name: "")
      pc.should_not be_valid
    end
  end
end
