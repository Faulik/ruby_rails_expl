require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'Get #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'gets created posts' do
      first_post = FactoryGirl.create(:post, title: 'First')
      second_post = FactoryGirl.create(:post, title: 'Second')
      get :index
      expect(assigns(:posts)).to match_array([first_post, second_post])
    end
  end

  describe 'Get #show' do
    it 'renders the show template' do
      post = FactoryGirl.create(:post)
      get :show, id: post
      expect(response).to render_template(:show)
    end

    it 'get\' the correct post' do
      post = FactoryGirl.create(:post)
      get :show, id: post
      expect(assigns(:post)).to eq post
    end
  end

  describe 'Get #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'has post object to populate' do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'Get #edit' do
    it 'renders the edit template' do
      post = FactoryGirl.create(:post)
      get :edit, id: post
      expect(response).to render_template(:edit)
    end

    it 'get\' the correct post' do
      post = FactoryGirl.create(:post)
      get :edit, id: post
      expect(assigns(:post)).to eq post
    end
  end

  describe 'Post #create' do
    context 'with valid parameters' do
      it 'saves new post' do
        expect { 
          post :create, post: FactoryGirl.attributes_for(:post) 
        }.to change(Post, :count).by(1)
      end

      it 'redirects to posts#show' do
        post :create, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to post_path(assigns[:post])
      end
    end

    context 'with invalid parameters' do
      it 'does not save new post' do
        expect { 
          post :create, post: FactoryGirl.attributes_for(:post, title: nil) 
        }.to_not change(Post, :count)
      end

      it 'redirects to posts#show' do
        post :create, post: FactoryGirl.attributes_for(:post, title: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe 'Patch #update' do
    let(:post) { FactoryGirl.create(:post) }

    context 'with valid parameters' do
      it 'get\'s correct post' do
        patch :update, id: post, post: post.attributes
        expect(assigns(:post)).to eq post
      end

      it 'update\'s post' do
        patch :update, id: post, 
              post: FactoryGirl.attributes_for(:post,
                                               title: 'New title',
                                               content: 'New content')
        post.reload
        expect(post.title).to eq('New title')
        expect(post.content).to eq('New content')
      end

      it 'redirects to posts#show' do
        patch :update, id: post, post: post.attributes
        expect(response).to redirect_to post_path(assigns[:post])
      end
    end

    context 'with invalid parameters' do
      it 'doesn\'t update\'s post' do
        patch :update, id: post, 
              post: FactoryGirl.attributes_for(:post,
                                               title: 'New title',
                                               content: nil)
        post.reload
        expect(post.title).to_not eq('New title')
        expect(post.content).to eq('Post content')
      end

      it 'redirects to posts#edit' do
        patch :update, id: post, 
              post: FactoryGirl.attributes_for(:post,
                                               title: 'New title',
                                               content: nil)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'Delete #destroy' do
    let!(:post) { FactoryGirl.create(:post) }

    it 'deletes the post' do
      expect { delete :destroy, id: post }.to change(Post, :count).by(-1)
    end

    it 'redirects to posts#index' do
      delete :destroy, id: post
      expect(response).to redirect_to posts_path
    end
  end
end
