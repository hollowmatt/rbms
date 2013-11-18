require 'spec_helper'

describe HomeController do

	describe "GET index" do
		before (:each) { get :index}

		it "assigns popular movies" do
			expect(assigns(:popular)).to_not be_nil
		end

		it "assigns playing movies" do
			expect(assigns(:playing)).to be_nil
		end

		it "assigns coming movies" do
			expect(assigns(:coming)).to be_nil
		end

		it "renders the index view" do
			expect(response).to render_template("index")
		end
	end
end