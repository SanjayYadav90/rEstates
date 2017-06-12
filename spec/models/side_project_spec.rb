require 'rails_helper'

# Test suite for the SideProject model
RSpec.describe SideProject, type: :model do
  
  # Validation tests
  # ensure columns street and created_by are present before saving
  it { should validate_presence_of(:street) }
  it { should validate_presence_of(:created_by) }
end