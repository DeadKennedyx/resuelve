class PlayersController < ApplicationController
  def total_salary
    set_players_and_teams(params['_json'])
    begin
      render json: Player.complete_salaries, status: :ok
    rescue => error
      render json: { error: error }, status: :bad_request
    end
  end

  private

  # aquí en set_players_and_teams en vez de hacer dup de un seed podria venir la meta de cada equipo en el json del front
  # para guardar el goal de diferentes equipos y así calcular de varios equipos
  # y no solo de resuelve

  def set_players_and_teams(data)
    data.each do |player_data|
      @player_data = data
      team = Team.find_or_create_by(name: player_data['equipo']) do |team|
        new_team_goal = TeamGoal.first.dup
        team.team_goal = new_team_goal
      end
      Player.find_or_create_by(name: player_data['nombre']) do |player|
        binding.pry
        player.goals = player_data['goles']
        player.salary = player_data['sueldo']
        player.bonus = player_data['bono']
        player.level = player_data['nivel']
        player.team = team
      end
    end
  end
end
