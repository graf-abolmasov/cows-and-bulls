require 'rails_helper'

describe MovesController do

  render_views

  describe '#create' do
    let(:game) { create :game }

    subject do
      xhr :post, :create, game_id: game.id, number: 98765, format: :json
      response
    end

    specify('actually creates move') { expect(subject).to create_resource }
    specify('response have won node') { expect(subject).to have_json_node(:won) }
    specify('response have cows node') { expect(subject).to have_json_node(:cows).with(0) }
    specify('response have bulls node') { expect(subject).to have_json_node(:bulls).with(1) }
  end
end
