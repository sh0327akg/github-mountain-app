class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    grass = @post.scrape_github
    mountains = Mountain.where('elevation <= ?', grass)
    mountain = mountains.min_by {|x| (x.elevation - grass).abs}
    @post.mountain_id = mountain.id
  end

  private

  def post_params
    params.require(:post).permit(:account_name)
  end
end
