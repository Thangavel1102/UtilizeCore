class Parcel < ApplicationRecord

	STATUS = ['Sent', 'In Transit', 'Delivered']
	PAYMENT_MODE = ['COD', 'Prepaid']

	validates :weight, :status, presence: true
	validates :status, inclusion: STATUS
	validates :payment_mode, inclusion: PAYMENT_MODE

	belongs_to :service_type
	belongs_to :sender, class_name: 'User'
	belongs_to :receiver, class_name: 'User'

	after_create :send_notification
	after_update :status_notification, if: :saved_change_to_status?

	private

	def send_notification
		UserMailer.with(parcel: self).status_email.deliver_now
	end

	def status_notification
		UserMailer.with(parcel: self).parcel_status_change.deliver_now
	end

end
