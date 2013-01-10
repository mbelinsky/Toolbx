class AddAttachmentIconToTools < ActiveRecord::Migration
  def self.up
    change_table :tools do |t|
      t.attachment :icon
    end
  end

  def self.down
    drop_attached_file :tools, :icon
  end
end
