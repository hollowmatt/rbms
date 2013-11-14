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
    let(:title) {'planet'}

		it "assigns @movie_tiles" do
      get :find, {:title => title}
      expect(assigns(:movie_tiles)).to_not be_nil
    end

		it "renders the :find view" do
      get :find, {:title => title}
      expect(response).to render_template('find')
    end
	end

end