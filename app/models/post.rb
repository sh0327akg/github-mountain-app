class Post < ApplicationRecord
  belongs_to :mountain_list

  validates :account_name, presence: true, format: { with: /\A[0-9a-zA-Z-_]*\z/, message: "半角英数字のみが使えます"}

  validate :exist_on_github

  private

  def exist_on_github
    target_uri = "https://github.com/#{self.name}"
    uri = URI.parse(target_uri)
    response = Net::HTTP.get_response(uri)
    errors.add(:account_name, "GitHubに存在しないアカウント名です") if response.code == "404"
  end
end