require 'rails_helper'

# Test suite for the SideProject model
RSpec.describe SideProject, type: :model do
  
  it { should validate_presence_of(:street) }
  it { should validate_presence_of(:created_by) }
end