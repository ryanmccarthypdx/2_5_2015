require 'spec_helper'

describe Letter do
  it { should have_and_belong_to_many (:words) }
end
