require 'rails_helper'

shared_examples 'do not expose secret number' do
  { index: :get, create: :post }.each do |action, method|
    describe "#{:action}" do
      let!(:game) { create :game }
      subject { xhr method, action, format: :json }
      specify('should not contains secret number') do
        expect(subject).to_not have_json_node(:random_number)
      end
    end
  end
end

describe GamesController do

  render_views

  it_behaves_like 'do not expose secret number'

  describe '#index' do
    let!(:game) { create :game }
    subject { xhr :get, :index, format: :json }

    specify('should contain root node games') { expect(subject).to have_json_node(:games) }
    specify('should contain game node with id') { expect(subject).to have_json_node(:id).with(game.id) }
  end

  describe '#create' do
    subject { xhr :post, :create, format: :json }

    specify('should create a game') { expect { subject }.to change(Game, :count).by(1) }
    specify('should respond 201 status') { expect(subject).to create_resource }

    context 'when explicit level present' do
      subject do
        post :create, game: {level: 5}, format: :json
        controller.game.level
      end
      specify('should create game with provided level') { expect(subject).to eq(5) }
    end
  end
end
