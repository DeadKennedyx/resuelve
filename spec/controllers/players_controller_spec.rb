# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  context 'with correctly formatted json' do
    let(:authorized_roles) { %i[master admin] }
    let(:params) do
      {'_json':
          [{
            "nombre"=> "El Rulo",
            "nivel"=> "B",
            "goles"=> 9,
            "sueldo"=> 30000,
            "bono"=> 15000,
            "sueldo_completo"=>  nil,
            "equipo"=> "rojo"
          }]
      }
    end

    subject { response }

    describe 'post #total_salary' do
      it 'returns 200' do
        FactoryBot.create :team_goal
        post :total_salary, params: params
        expect(subject.status).to eq(200)
      end
    end

  end
end
