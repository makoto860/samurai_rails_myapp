class Rent < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_people, presence: true
  validate :date_before_start
  validate :date_before_finish

  def save_rent(rent, rent_params)
    rent.start_date = rent_params[:start_date]
    rent.end_date = rent_params[:end_date]
    rent.total_people = rent_params[:total_people]
    rent.total_day = rent_params[:total_day]
    rent.total_amount = rent_params[:total_amount]
    rent.user_id = rent_params[:user_id]
    rent.product_id = rent_params[:product_id]
    save
  end

  def sum_of_days
    (end_date.to_date - start_date.to_date).to_i if start_date.present? && end_date.present?
  end

  def sum_of_amount
    (product.amount * total_people * sum_of_days).to_i if start_date.present? && end_date.present?
  end

  def date_before_start
    errors.add(:start_date, "開始日は今日以降のものを選択してください") if start_date < Date.tomorrow
  end

  def date_before_finish
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, "終了日は開始日以降のものを選択してください") if end_date < start_date
  end
end

