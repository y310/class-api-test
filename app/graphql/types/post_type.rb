class Types::PostType < Types::BaseObject
  description 'Post object'

  field :title, String, null: false
  field :body, String, null: true
end
