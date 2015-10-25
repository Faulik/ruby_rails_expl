require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe 'Get #show' do
    it 'renders the show template' do
      tag = FactoryGirl.create(:tag)
      get :show, id: tag.slug
      expect(response).to render_template(:show)
    end

    it 'get\' the correct article' do
      tag = FactoryGirl.create(:tag)
      article = FactoryGirl.create(:article)
      get :show, id: tag.slug
      expect(assigns(:content)).to eq [article]
    end

    it 'get\' the correct post' do
      tag = FactoryGirl.create(:tag)
      post = FactoryGirl.create(:post)
      get :show, id: tag.slug
      expect(assigns(:content)).to eq [post]
    end

    it 'get\' the correct event' do
      tag = FactoryGirl.create(:tag)
      event = FactoryGirl.create(:event)
      get :show, id: tag.slug
      expect(assigns(:content)).to eq [event]
    end

    it 'get\' the correct array of event, article and post' do
      tag = FactoryGirl.create(:tag)
      event = FactoryGirl.create(:event)
      post = FactoryGirl.create(:post)
      article = FactoryGirl.create(:article)
      get :show, id: tag.slug
      expect(assigns(:content)).to eq [event, post, article]
    end
  end
end
