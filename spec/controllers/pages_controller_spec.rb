require 'spec_helper'

describe PagesController do
  describe 'login' do
    it 'shows the login form' do
      get :login
    end
  end
end