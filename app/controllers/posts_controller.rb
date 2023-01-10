class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    grass = @post.scrape_github
    Mountain.where()
    @post.merge(mountain_id: Mountain.id)
  end

  private

  def post_params
    params.require(:post).permit(:account_name)
  end

  def scrape_github
    agent = Mechanize.new
    page = agent.get("https://github.com/#{account_name}")
    grass = page.search('//h2[@class = "f4 text-normal mb-2"]').inner_text
    grass.delete!('in the last year')
    grass.delete!('cobuo')
    grass.gsub(/[\r\n]/,"")

    return grass.to_i
  end
end
