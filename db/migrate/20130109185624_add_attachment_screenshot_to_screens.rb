class AddAttachmentScreenshotToScreens < ActiveRecord::Migration
  def self.up
    change_table :screens do |t|
      t.attachment :screenshot
    end
  end

  def self.down
    drop_attached_file :screens, :screenshot
  end
end
