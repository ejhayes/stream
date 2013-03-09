require 'spec_helper'

describe DashboardController do

	describe 'dashboard' do

		it 'requires me to be signed in to see my dashboard' do
			get :dashboard

			response.should redirect_to '/'
		end

		it 'shows my dashboard if i am signed in' do
			user = FactoryGirl.create(:user)
			session[:user_id] = user.id
			get :dashboard
		end

	end

end