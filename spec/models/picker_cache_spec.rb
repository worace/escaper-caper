require 'spec_helper'

describe PickerCache do
  before(:each) do
    PickerCache.clear_keys
  end

  context(".client") do
    it "wraps a namespaced redis client" do
      PickerCache.client.should be_a(Redis::Namespace)
    end
  end

  context(".set_cat_id") do
    it "sets a parent_category:id for the escape key given" do
      PickerCache.set_cat_id("escape:1", "1")
      PickerCache.client.hget("escape:1", "parent_category:id").should == "1"
    end
  end

  context(".cat_id") do
    before do
      PickerCache.set_cat_id("escape:1", "1")
    end

    it "returns the parent_category:id for the escape key given" do
      PickerCache.cat_id("escape:1").should == "1"
    end

    it "returns nil if a key is not set" do
      PickerCache.cat_id("escape:243525").should == nil
    end
  end

  context(".clear_keys") do
    it "clears the keys in the client namespace" do
      PickerCache.set_cat_id("escape:1", "1")
      PickerCache.set_cat_id("escape:2", "1")
      PickerCache.set_cat_id("escape:3", "1")

      PickerCache.clear_keys

      PickerCache.client.keys.should == []
    end

    it "is idempotent" do
      PickerCache.set_cat_id("escape:1", "1")
      PickerCache.clear_keys
      expect{PickerCache.clear_keys}.not_to raise_error
    end
  end
end
