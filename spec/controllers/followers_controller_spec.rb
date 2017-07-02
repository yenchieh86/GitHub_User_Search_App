require 'rails_helper'

RSpec.describe FollowersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    describe "button" do
      before do
        @follower_list = %q!
          [
            {
              "login": "follower_a",
              "id": 2398264,
              "avatar_url": "https://avatars0.githubusercontent.com/u/2398264?v=3",
              "gravatar_id": "",
              "url": "https://api.github.com/users/follower_a",
              "html_url": "https://github.com/follower_a",
              "followers_url": "https://api.github.com/users/follower_a/followers",
              "following_url": "https://api.github.com/users/follower_a/following{/other_user}",
              "gists_url": "https://api.github.com/users/follower_a/gists{/gist_id}",
              "starred_url": "https://api.github.com/users/follower_a/starred{/owner}{/repo}",
              "subscriptions_url": "https://api.github.com/users/follower_a/subscriptions",
              "organizations_url": "https://api.github.com/users/follower_a/orgs",
              "repos_url": "https://api.github.com/users/follower_a/repos",
              "events_url": "https://api.github.com/users/follower_a/events{/privacy}",
              "received_events_url": "https://api.github.com/users/follower_a/received_events",
              "type": "User",
              "site_admin": false
            },
            {
              "login": "follower_b",
              "id": 3164166,
              "avatar_url": "https://avatars2.githubusercontent.com/u/3164166?v=3",
              "gravatar_id": "",
              "url": "https://api.github.com/users/follower_b",
              "html_url": "https://github.com/follower_b",
              "followers_url": "https://api.github.com/users/follower_b/followers",
              "following_url": "https://api.github.com/users/follower_b/following{/other_user}",
              "gists_url": "https://api.github.com/users/follower_b/gists{/gist_id}",
              "starred_url": "https://api.github.com/users/follower_b/starred{/owner}{/repo}",
              "subscriptions_url": "https://api.github.com/users/follower_b/subscriptions",
              "organizations_url": "https://api.github.com/users/follower_b/orgs",
              "repos_url": "https://api.github.com/users/follower_b/repos",
              "events_url": "https://api.github.com/users/follower_b/events{/privacy}",
              "received_events_url": "https://api.github.com/users/follower_b/received_events",
              "type": "User",
              "site_admin": false
            }
          ]
        !
        
        @no_follower ='[]'
      end
      
      describe 'next button' do
        it 'should be false' do
          allow_any_instance_of(ApplicationController).to receive(:get_follower_list).and_return(@no_follower)
          get :index, xhr: true
          expect(assigns(:next_button)).to eq false
        end
        
        it 'should be true' do
          allow_any_instance_of(ApplicationController).to receive(:get_follower_list).and_return(@follower_list)
          get :index, xhr: true
          expect(assigns(:next_button)).to eq true
        end
      end
      
      describe 'last button' do
        before { allow_any_instance_of(ApplicationController).to receive(:get_follower_list).and_return(@follower_list) }
        
        it 'should be false' do
          get :index, params: { page_num: 1 },xhr: true
          expect(assigns(:last_button)).to eq false
        end
        
        it 'should be true' do
          get :index, params: { page_num: 2 }, xhr: true
          expect(assigns(:last_button)).to eq true
        end
      end
    end
  end

end
