namespace :export_excel do
  desc "TODO"
  task download: :environment do
  	puts "Hello world"
  	p = Axlsx::Package.new
  	wb = p.workbook
  	wb.styles do |style|
  	  project_heading = style.add_style(b: true, sz: 14)
  	  heading = style.add_style(b: true)

  	  wb.add_worksheet(name: "Couriers") do |sheet|
  	    # Add the date this was downloaded
  	    sheet.add_row ["Downloaded at", Time.now.strftime("%b %-d, %Y")]
  	    # Add a blank row
  	    sheet.add_row []
  	    # Create the header row
  	    sheet.add_row ["Sender Name", "Sender Address", "Sender Mobile", "Sender Pincode", "Receiver Name", "Receiver Address", "Receiver Phone", "Receiver Pincode", "Parcel Weight", "Service Type", "Cost of Service", "Payment Mode", "Status"], style: heading
  	    # Create entries for each item
  	    
  	    Parcel.includes(:service_type, :sender, :receiver).each do |parcel|
  	      sheet.add_row [parcel.sender.name, parcel.sender.name_with_address, parcel.sender.address.mobile_number, parcel.sender.address.pincode,parcel.receiver.name, parcel.receiver.name_with_address, parcel.receiver.address.mobile_number, parcel.receiver.address.pincode,parcel.weight,parcel.service_type.name,parcel.cost, parcel.payment_mode, parcel.status]
  	    end
  	  end
  	end
  	p.use_shared_strings = true
  	p.serialize("#{Rails.root}/public/generated_xls/#{Time.now.to_s}.xlsx")
  end

end
