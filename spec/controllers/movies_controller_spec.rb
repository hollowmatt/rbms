require 'spec_helper'

describe MoviesController do 

	describe 'GET #show' do
		let (:id) {107}
		it "assigns @movie" do
			get :show, {:id => id}
			expect(assigns(:movie)).to_not be_nil
		end

		it "assigns @cast_list" do
			get :show, {:id => id}
			expect(assigns(:cast_list)).to_not be_nil
		end
		
		it "assigns @movie_list" do
			get :show, {:id => id}
			expect(assigns(:movie_list)).to_not be_nil
		end

		it "renders the :show view" do
			get :show, {:id => id}
			expect(response).to render_template("show")
		end
	end

	describe 'GET #find' do
		it "assigns @movies"
		it "renders the :find view"
	end

end