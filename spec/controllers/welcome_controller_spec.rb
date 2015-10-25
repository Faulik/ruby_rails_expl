require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'Get #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'get\'s created articles' do
      first_article = FactoryGirl.create(:article, title: 'First')
      second_article = FactoryGirl.create(:article, title: 'Second')
      get :index
      expect(assigns(:articles)).to match_array([first_article, second_article])
    end

    it 'get\'s created posts' do
      first_post = FactoryGirl.create(:post, title: 'First')
      second_post = FactoryGirl.create(:post, title: 'Second')
      get :index
      expect(assigns(:posts)).to match_array([first_post, second_post])
    end

    it 'get\'s created events' do
      first_event = FactoryGirl.create(:event, title: 'First')
      second_event = FactoryGirl.create(:event, title: 'Second')
      get :index
      expect(assigns(:events)).to match_array([first_event, second_event])
    end
  end

end
