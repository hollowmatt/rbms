require 'spec_helper'

describe "Actor" do 
	it "is invalid without an id" do
		expect { Actor.new }.to raise_error(ArgumentError)
	end

	it "is valid with an id" do
		expect {Actor.new(:id => 7)}.to_not raise_error
	end
end