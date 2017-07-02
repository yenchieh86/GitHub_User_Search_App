require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #search" do
    before do
      @follower_list = [
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
    end
    
    describe "didn't enter username" do
      before do
        @github_response = %q!
          {
            "message": "Validation Failed",
            "errors": [
              {
                "resource": "Search",
                "field": "q",
                "code": "missing"
              }
            ],
            "documentation_url": "https://developer.github.com/v3/search"
          }
        !
        
        allow_any_instance_of(ApplicationController).to receive(:get_element).and_return(@github_response)
      end
    
      it 'should be 0' do
        get :search, xhr: true
        expect(assigns(:user)).to eq 0
      end
    end
    
    describe "no user in the list" do
      before do
        @github_response = %q!
          {
            "total_count": 0,
            "incomplete_results": false,
            "items": [
            ]
          }
        !
        
        allow_any_instance_of(ApplicationController).to receive(:get_element).and_return(@github_response)
      end
    
      it 'should be 0' do
        get :search, params: { q: 'test_c' }, xhr: true
        expect(assigns(:user)).to eq 0
      end
    end
    
    describe "user is not in the list" do
      before do
        @github_response = %q!
          {
            "total_count": 3,
            "incomplete_results": false,
            "items": [
              {
                "login": "test_a",
                "id": 2829600,
                "avatar_url": "https://avatars2.githubusercontent.com/u/0000001?v=3",
                "gravatar_id": "",
                "url": "https://api.github.com/users/test_a",
                "html_url": "https://github.com/test_a",
                "followers_url": "https://api.github.com/users/test_a/followers",
                "following_url": "https://api.github.com/users/test_a/following{/other_user}",
                "gists_url": "https://api.github.com/users/test_a/gists{/gist_id}",
                "starred_url": "https://api.github.com/users/test_a/starred{/owner}{/repo}",
                "subscriptions_url": "https://api.github.com/users/test_a/subscriptions",
                "organizations_url": "https://api.github.com/users/test_a/orgs",
                "repos_url": "https://api.github.com/users/test_a/repos",
                "events_url": "https://api.github.com/users/test_a/events{/privacy}",
                "received_events_url": "https://api.github.com/users/test_a/received_events",
                "type": "User",
                "site_admin": false,
                "score": 148.81787
              },
              {
                "login": "test_b",
                "id": 25064909,
                "avatar_url": "https://avatars0.githubusercontent.com/u/00000002?v=3",
                "gravatar_id": "",
                "url": "https://api.github.com/users/test_b",
                "html_url": "https://github.com/test_b",
                "followers_url": "https://api.github.com/users/test_b/followers",
                "following_url": "https://api.github.com/users/test_b/following{/other_user}",
                "gists_url": "https://api.github.com/users/test_b/gists{/gist_id}",
                "starred_url": "https://api.github.com/users/test_b/starred{/owner}{/repo}",
                "subscriptions_url": "https://api.github.com/users/test_b/subscriptions",
                "organizations_url": "https://api.github.com/users/test_b/orgs",
                "repos_url": "https://api.github.com/users/test_b/repos",
                "events_url": "https://api.github.com/users/test_b/events{/privacy}",
                "received_events_url": "https://api.github.com/users/test_b/received_events",
                "type": "User",
                "site_admin": false,
                "score": 8.317931
              }
            ]
          }
        !
        
        allow_any_instance_of(ApplicationController).to receive(:get_element).and_return(@github_response)
      end
    
      it 'should be 0' do
        get :search, params: { q: 'test_c' }, xhr: true
        expect(assigns(:user)).to eq 0
      end
    end
    
    describe "user is not in the list" do
      before do
        @github_response = %q!
          {
            "total_count": 3,
            "incomplete_results": false,
            "items": [
              {
                "login": "test_a",
                "id": 2829600,
                "avatar_url": "https://avatars2.githubusercontent.com/u/0000001?v=3",
                "gravatar_id": "",
                "url": "https://api.github.com/users/test_a",
                "html_url": "https://github.com/test_a",
                "followers_url": "https://api.github.com/users/test_a/followers",
                "following_url": "https://api.github.com/users/test_a/following{/other_user}",
                "gists_url": "https://api.github.com/users/test_a/gists{/gist_id}",
                "starred_url": "https://api.github.com/users/test_a/starred{/owner}{/repo}",
                "subscriptions_url": "https://api.github.com/users/test_a/subscriptions",
                "organizations_url": "https://api.github.com/users/test_a/orgs",
                "repos_url": "https://api.github.com/users/test_a/repos",
                "events_url": "https://api.github.com/users/test_a/events{/privacy}",
                "received_events_url": "https://api.github.com/users/test_a/received_events",
                "type": "User",
                "site_admin": false,
                "score": 148.81787
              },
              {
                "login": "test_b",
                "id": 25064909,
                "avatar_url": "https://avatars0.githubusercontent.com/u/00000002?v=3",
                "gravatar_id": "",
                "url": "https://api.github.com/users/test_b",
                "html_url": "https://github.com/test_b",
                "followers_url": "https://api.github.com/users/test_b/followers",
                "following_url": "https://api.github.com/users/test_b/following{/other_user}",
                "gists_url": "https://api.github.com/users/test_b/gists{/gist_id}",
                "starred_url": "https://api.github.com/users/test_b/starred{/owner}{/repo}",
                "subscriptions_url": "https://api.github.com/users/test_b/subscriptions",
                "organizations_url": "https://api.github.com/users/test_b/orgs",
                "repos_url": "https://api.github.com/users/test_b/repos",
                "events_url": "https://api.github.com/users/test_b/events{/privacy}",
                "received_events_url": "https://api.github.com/users/test_b/received_events",
                "type": "User",
                "site_admin": false,
                "score": 8.317931
              },
              {
                "login": "test_c",
                "id": 25064909,
                "avatar_url": "https://avatars0.githubusercontent.com/u/00000002?v=3",
                "gravatar_id": "",
                "url": "https://api.github.com/users/test_c",
                "html_url": "https://github.com/test_c",
                "followers_url": "https://api.github.com/users/test_c/followers",
                "following_url": "https://api.github.com/users/test_c/following{/other_user}",
                "gists_url": "https://api.github.com/users/test_c/gists{/gist_id}",
                "starred_url": "https://api.github.com/users/test_c/starred{/owner}{/repo}",
                "subscriptions_url": "https://api.github.com/users/test_c/subscriptions",
                "organizations_url": "https://api.github.com/users/test_c/orgs",
                "repos_url": "https://api.github.com/users/test_c/repos",
                "events_url": "https://api.github.com/users/test_c/events{/privacy}",
                "received_events_url": "https://api.github.com/users/test_c/received_events",
                "type": "User",
                "site_admin": false,
                "score": 8.317931
              }
            ]
          }
        !
        
        allow_any_instance_of(ApplicationController).to receive(:get_element).and_return(@github_response)
      end
    
      it 'should be 0' do
        user = JSON.parse(@github_response)["items"][2]
        user["total_follower"] = ''
        get :search, params: { q: 'test_c' }, xhr: true
        
        expect(assigns(:user)).to eq user
      end
    end
  end
  
end
