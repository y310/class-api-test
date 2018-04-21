require 'rails_helper'

describe ClassApiTestSchema do
  let(:variables) { {} }
  let(:context) { {} }
  let(:response) do
    ClassApiTestSchema.execute(query, variables: variables, context: context).as_json
  end

  context 'viewer' do
    let(:user) { User.create(name: 'test_user') }
    let(:context) { { current_user: user } }
    let(:query) do
      <<-QUERY
        query {
          viewer {
            name
          }
        }
      QUERY
    end

    it { expect(response['data']['viewer']['name']).to eq 'test_user' }
  end
end
