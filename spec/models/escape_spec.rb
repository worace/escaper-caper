require 'spec_helper'

describe Escape do
  context("#parent_category") do
    let!(:escape) { FactoryGirl.create(:culture_escape) }
    let(:art_galleries) { FactoryGirl.create(:art_galleries) }
    let(:gallery) { FactoryGirl.create(:gallery, escape_id: escape.id) }

    before do
      gallery.categories << art_galleries
    end

    it "returns the parent category for the escape based on its attractions" do
      escape.parent_category.should == art_galleries.parent_category
    end

    it "returns a default category for escapes not having any venues" do
      sad_escape = FactoryGirl.create(:food_escape)
      sad_escape.parent_category.should == ParentCategory.last
    end

    context "using the cache" do
      before do
        PickerCache.clear_keys
      end

      it "sets the cache key on the first call" do
        PickerCache.should_receive(:set_cat_id).with(escape.picker_cache_key, art_galleries.parent_category.id.to_s)
        escape.parent_category
      end

      it "uses the cache after it has been set" do
        PickerCache.should_receive(:cat_id).with(escape.picker_cache_key)
        escape.parent_category
      end
    end
  end

  context("#picker_cache_key") do
    let!(:escape) { FactoryGirl.create(:culture_escape) }
    it "returns a string to use as a key in the cache hash" do
      escape.picker_cache_key.should == "escape:#{escape.id}"
    end
  end

  context("#cached_category") do
    let!(:escape) { FactoryGirl.create(:culture_escape) }
    let!(:pc)     { FactoryGirl.create(:parent_category) }
    it "returns the parent_category from the cache" do
      PickerCache.stub(:cat_id).and_return(pc.id)
      escape.cached_category.should == pc
    end

    it "returns nil if no cat has been set in the cache" do
      PickerCache.stub(:cat_id).and_return(nil)
      escape.cached_category.should == nil
    end
  end

  context("#set_cached_category") do
    let!(:escape) { FactoryGirl.create(:culture_escape) }
    let!(:pc)     { FactoryGirl.create(:parent_category) }
    it "returns the category id from the cache" do
      PickerCache.should_receive(:set_cat_id).with(escape.picker_cache_key, pc.id.to_s)
      escape.set_cached_category(pc)
    end
  end
end
