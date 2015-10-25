require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'Get #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'gets created events' do
      first_event = FactoryGirl.create(:event, title: 'First')
      second_event = FactoryGirl.create(:event, title: 'Second')
      get :index
      expect(assigns(:events)).to match_array([first_event, second_event])
    end
  end

  describe 'Get #show' do
    it 'renders the show template' do
      event = FactoryGirl.create(:event)
      get :show, id: event
      expect(response).to render_template(:show)
    end

    it 'get\' the correct event' do
      event = FactoryGirl.create(:event)
      get :show, id: event
      expect(assigns(:event)).to eq event
    end
  end

  describe 'Get #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'has event object to populate' do
      get :new
      expect(assigns(:event)).to be_a_new(Event)
    end
  end

  describe 'Get #edit' do
    it 'renders the edit template' do
      event = FactoryGirl.create(:event)
      get :edit, id: event
      expect(response).to render_template(:edit)
    end

    it 'get\' the correct event' do
      event = FactoryGirl.create(:event)
      get :edit, id: event
      expect(assigns(:event)).to eq event
    end
  end

  describe 'Post #create' do
    context 'with valid parameters' do
      it 'saves new event' do
        expect { 
          post :create, event: FactoryGirl.attributes_for(:event) 
        }.to change(Event, :count).by(1)
      end

      it 'redirects to events#show' do
        post :create, event: FactoryGirl.attributes_for(:event)
        expect(response).to redirect_to event_path(assigns[:event])
      end
    end

    context 'with invalid parameters' do
      it 'does not save new event' do
        expect { 
          post :create, event: FactoryGirl.attributes_for(:event, title: nil) 
        }.to_not change(Event, :count)
      end

      it 'redirects to events#show' do
        post :create, event: FactoryGirl.attributes_for(:event, title: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe 'Patch #update' do
    let(:event) { FactoryGirl.create(:event) }

    context 'with valid parameters' do
      it 'get\'s correct event' do
        patch :update, id: event, event: event.attributes
        expect(assigns(:event)).to eq event
      end

      it 'update\'s event' do
        patch :update, id: event, 
              event: FactoryGirl.attributes_for(:event,
                                               title: 'New title',
                                               address: 'New address')
        event.reload
        expect(event.title).to eq('New title')
        expect(event.address).to eq('New address')
      end

      it 'redirects to events#show' do
        patch :update, id: event, event: event.attributes
        expect(response).to redirect_to event_path(assigns[:event])
      end
    end

    context 'with invalid parameters' do
      it 'doesn\'t update\'s event' do
        patch :update, id: event, 
              event: FactoryGirl.attributes_for(:event,
                                               title: 'New title',
                                               address: nil)
        event.reload  
        expect(event.title).to_not eq('New title')
        expect(event.address).to eq('Event address')
      end

      it 'redirects to events#edit' do
        patch :update, id: event, 
              event: FactoryGirl.attributes_for(:event,
                                               title: 'New title',
                                               address: nil)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'Delete #destroy' do
    let!(:event) { FactoryGirl.create(:event) }

    it 'deletes the event' do
      expect { delete :destroy, id: event }.to change(Event, :count).by(-1)
    end

    it 'redirects to events#index' do
      delete :destroy, id: event
      expect(response).to redirect_to events_path
    end
  end
end
