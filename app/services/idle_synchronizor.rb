# frozen_string_literal: true

class IdleSynchronizor
  def perform(idle_game)
    update_sync_date(idle_game)
  end

  private

  def update_sync_date(idle_game)
    idle_game.update!(last_sync: Time.now)
  end
end
