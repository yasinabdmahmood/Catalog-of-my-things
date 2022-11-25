require_relative '../src/game/game'
require_relative '../src/label/label'
require_relative '../utils/helper'
require_relative '../utils/msg'

def add_new_game
  title,
  pub_date,
  color,
  last_played_at,
  multiplayer = Helper.ask_for_user_inputs(
    'Enter game\'s name : ',
    'Enter game launch date [YYYY-MM-DD] : ',
    'Enter the game\'s color : ',
    'When was the last time you played [YYYY-MM-DD] : ',
    'Is it multiplayer game ? (y/n) : '
  )
  multiplayer = multiplayer.downcase == 'y'
  game = Game.new(multiplayer, pub_date, last_played_at)
  label = Label.new(title, color)
  label.add_item(game)
  Helper.store_game(game)
  [game, label]
end
