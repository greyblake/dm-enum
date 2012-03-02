require 'spec_helper'

describe DataMapper::Enum do
  before :all do
    Language.create(:code => "ru", :name => "Russian")
    Country.create(:name => "Ukraine")
    City.create(:name => "Kharkov")

    Language.update_enums_cache!
    Country.update_enums_cache!
  end

  describe '.[]' do
    context 'name_property is other than default' do
      context 'symbol passed' do
        subject { Language[:ru] }

        it { should be_an_instance_of Language }
        its(:code) { should == 'ru' }
        its(:name) { should == 'Russian' }
      end

      context 'string passed' do
        subject { Language[:ru] }

        it { should be_an_instance_of Language }
        its(:code) { should == 'ru' }
        its(:name) { should == 'Russian' }
      end

      context 'non-existing value' do
        subject { Language[:wtf] }

        it { should be_nil}
      end
    end

    context 'default name_property' do
      subject { Country[:Ukraine] }

      it { should be_an_instance_of Country }
      its(:name) { should == "Ukraine" }
    end

    context "forgot to call update_enums_cache!" do
      it "raises an error with meaningful message" do
        error_message = "Looks like you forgot to call `City.update_enums_cache!` before using `City[:Kharkov]`"
        expect { City[:Kharkov] }.to raise_error(RuntimeError, error_message)
      end
    end
  end
end
