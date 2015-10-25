require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'Get #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'gets created articles' do
      first_article = FactoryGirl.create(:article, title: 'First')
      second_article = FactoryGirl.create(:article, title: 'Second')
      get :index
      expect(assigns(:articles)).to match_array([first_article, second_article])
    end
  end

  describe 'Get #show' do
    it 'renders the show template' do
      article = FactoryGirl.create(:article)
      get :show, id: article
      expect(response).to render_template(:show)
    end

    it 'get\' the correct article' do
      article = FactoryGirl.create(:article)
      get :show, id: article
      expect(assigns(:article)).to eq article
    end
  end

  describe 'Get #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'has article object to populate' do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe 'Get #edit' do
    it 'renders the edit template' do
      article = FactoryGirl.create(:article)
      get :edit, id: article
      expect(response).to render_template(:edit)
    end

    it 'get\' the correct article' do
      article = FactoryGirl.create(:article)
      get :edit, id: article
      expect(assigns(:article)).to eq article
    end
  end

  describe 'Article #create' do
    context 'with valid parameters' do
      it 'saves new article' do
        expect { 
          post :create, article: FactoryGirl.attributes_for(:article) 
        }.to change(Article, :count).by(1)
      end

      it 'redirects to articles#show' do
        post :create, article: FactoryGirl.attributes_for(:article)
        expect(response).to redirect_to article_path(assigns[:article])
      end
    end

    context 'with invalid parameters' do
      it 'does not save new article' do
        expect { 
          post :create, article: FactoryGirl.attributes_for(:article, title: nil) 
        }.to_not change(Article, :count)
      end

      it 'redirects to articles#show' do
        post :create, article: FactoryGirl.attributes_for(:article, title: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe 'Patch #update' do
    let(:article) { FactoryGirl.create(:article) }

    context 'with valid parameters' do
      it 'get\'s correct article' do
        patch :update, id: article, article: article.attributes
        expect(assigns(:article)).to eq article
      end

      it 'update\'s article' do
        patch :update, id: article, 
              article: FactoryGirl.attributes_for(:article,
                                               title: 'New title',
                                               content: 'New content')
        article.reload
        expect(article.title).to eq('New title')
        expect(article.content).to eq('New content')
      end

      it 'redirects to articles#show' do
        patch :update, id: article, article: article.attributes
        expect(response).to redirect_to article_path(assigns[:article])
      end
    end

    context 'with invalid parameters' do
      it 'doesn\'t update\'s article' do
        patch :update, id: article, 
              article: FactoryGirl.attributes_for(:article,
                                               title: 'New title',
                                               content: nil)
        article.reload
        expect(article.title).to_not eq('New title')
        expect(article.content).to eq('Article content')
      end

      it 'redirects to articles#edit' do
        patch :update, id: article, 
              article: FactoryGirl.attributes_for(:article,
                                               title: 'New title',
                                               content: nil)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'Delete #destroy' do
    let!(:article) { FactoryGirl.create(:article) }

    it 'deletes the article' do
      expect { delete :destroy, id: article }.to change(Article, :count).by(-1)
    end

    it 'redirects to articles#index' do
      delete :destroy, id: article
      expect(response).to redirect_to articles_path
    end
  end
end
