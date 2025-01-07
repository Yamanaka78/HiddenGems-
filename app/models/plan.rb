class Plan < ApplicationRecord
  belongs_to :user
  has_many :plan_spots, dependent: :destroy
  has_many :spots, through: :plan_spots

  enum category: {
    family: 0,    # 家族旅行
    date: 1,      # デート
    business: 2,  # 出張
    adventure: 3  # 観光
  }

  validates :plan_name, presence: true
  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past

  validates :end_date, presence: true
  validate :end_date_after_start_date

  validates :budget, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true, inclusion: { in: categories.keys }
  validates :number_of_people, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :weather_link, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "は有効なURLを入力してください" }, allow_blank: true

  private

  def start_date_cannot_be_in_the_past
    return if start_date.blank?

    if start_date < Date.today
      errors.add(:start_date, "は今日以降の日付を指定してください")
    end
  end

  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?

    if end_date < start_date
      errors.add(:end_date, "は開始日以降の日付を指定してください")
    end
  end
end
