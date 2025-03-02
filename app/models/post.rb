class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum:30}
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
  validates :memo, length: {maximum:500}

  validate :end_datetime_is_after_start_datetime

  private
  def end_datetime_is_after_start_datetime
    return if start_datetime.blank? || end_datetime.blank?
    if start_datetime > end_datetime
      errors.add(:end_datetime, "は開始日時より後の時間を選択してください")
    end
  end
end
