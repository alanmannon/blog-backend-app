require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "should return all the posts in the db" do
      user = User.create!(
        name: "Yella Belly",
        email: "Scaredeycat@snorkel.biz",
        password: "password",
      )
      Post.create!(
        user_id: user.id,
        title: "Smart things fish do",
        body: "Unfortunately there's not much",
        image: "fish_head.jpeg",
      )
      Post.create!(
        user_id: user.id,
        title: "Smart things fish do",
        body: "Unfortunately there's not much",
        image: "fish_head.jpeg",
      )
      Post.create!(
        user_id: user.id,
        title: "Smart things fish do",
        body: "Unfortunately there's not much",
        image: "fish_head.jpeg",
      )

      get "/api/posts"
      posts = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(posts.length).to eq(3)
    end
  end
  describe "GET /posts/:id" do
    it "should return the post that is called" do
      user = User.create!(
        name: "Yella Belly",
        email: "Scaredeycat@snorkel.biz",
        password: "password",
      )
      post = Post.create!(
        user_id: user.id,
        title: "Smart things fish do",
        body: "Unfortunately there's not much",
        image: "fish_head.jpeg",
      )
      get "/api/posts/#{post.id}"
      post = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(post["title"]).to eq("Smart things fish do")
      expect(post["body"]).to eq("Unfortunately there's not much")
    end
  end
end
