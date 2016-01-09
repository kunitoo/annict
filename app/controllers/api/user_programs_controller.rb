class Api::UserProgramsController < ApplicationController
  before_action :authenticate_user!

  def index(page: nil)
    @programs = current_user.
      programs.
      unchecked.
      work_published.
      episode_published.
      where('started_at < ?', Date.today + current_user.setting.show_program_days.days + 5.hours).
      includes(:channel, :work, episode: [:work]).
      order(started_at: :desc).
      page(page)
  end
end
