require 'rails_helper'

RSpec.describe Types::PostType do
  def resolve(type, field, obj, args = {}, ctx = {})
    ClassApiTestSchema.types[type].fields[field].resolve(obj, args, ctx)
  end

  let(:user) { User.create(name: 'user') }
  let(:post) { Post.create(title: 'title', body: 'body', user: user).decorate }
  let!(:comments) { [Comment.create(message: 'message', user: user, post: post)] }

  it { expect(resolve('Post', 'title', post)).to eq post.title }
  it { expect(resolve('Post', 'body', post)).to eq post.body }
  it { expect(resolve('Post', 'createdAt', post)).to eq post.created_at }
  it { expect(resolve('Post', 'user', post)).to eq user }
  it { expect(resolve('Post', 'comments', post).to_a).to eq comments }
end
