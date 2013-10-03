require 'spec_helper'

describe Receipt do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_numericality_of :quantity }
end
