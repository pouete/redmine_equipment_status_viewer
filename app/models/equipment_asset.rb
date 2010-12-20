class EquipmentAsset < ActiveRecord::Base
  unloadable

  has_many :asset_check_ins, :limit => 50

  validates_presence_of :name

  def location
    if asset_check_ins && asset_check_ins.last
      asset_check_ins.last.location
    else
      "Unknown"
    end
  end
end
