require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe HomeHelper do
  describe 'link' do
    before :each do
      @date = "2012/9/24".to_date
    end

    it 'generates a link to next month' do
      helper.link_to_next_month(@date).should == "<a href=\"/calendario/2012/10\">octubre</a>"
    end

    it 'generates a link to previous month' do
      helper.link_to_previous_month(@date).should == "<a href=\"/calendario/2012/8\">agosto</a>"
    end
  end
end
