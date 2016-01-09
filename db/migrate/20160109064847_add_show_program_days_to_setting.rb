class AddShowProgramDaysToSetting < ActiveRecord::Migration
  def change
    add_column :settings, :show_program_days, :integer, default: 2
  end
end
