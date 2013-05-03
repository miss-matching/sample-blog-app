require "spec_helper"

describe Post do
  describe "varidation" do
    it "should not be saved without name" do
      post = Post.new :title => "Hello, world"
      expect(post.save).to be(false)
    end

    it "should not be saved without title" do
      post = Post.new :name => "Andy"
      expect(post.save).to be(false)
    end

    it "should not be saved when titles' length is shorter than 5" do
      post = Post.new :title => "Hy"
      expect(post.save).to be(false)
    end
  end
end
