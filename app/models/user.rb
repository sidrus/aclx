require 'base64'

class User < ApplicationRecord
	has_many :vehicles

	scope :active, -> { User.all.select {|u| !u.inactive? }.sort_by(&:display_name) }

	def self.import_from_upload(file)
		spreadsheet = open_spreadsheet(file)
	  import(spreadsheet)
	end

	def self.import_from_google(file)
		file.export_as_file('members_temp.xlsx')
		spreadsheet = Roo::Excelx.new('members_temp.xlsx')
		import(spreadsheet)
	end

	def self.import(spreadsheet)
		header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    user = find_by_aclx_id(row["aclx_id"]) || new
	    user.attributes = row.to_hash

	    if !user.full_name.nil? then
	    	user.inactive = user.inactive || false
	    	user.save!
	    end
	  end
	end

	def self.next_aclx_id
		User.maximum(:aclx_id) + 1
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Roo::Csv.new(file.path)
	  when ".xls" then Roo::Excel.new(file.path)
	  when ".xlsx" then Roo::Excelx.new(file.path)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end

	def primary_vehicle
		self.vehicles.where(is_primary: true).first
	end

	def display_name
		full_name.titleize
	end

	def get_qr_string()	
		qr = RQRCode::QRCode.new("#{self.id}", :size => 4, :level => :h)
    return Base64.encode64(qr.to_img.to_string)
	end

	private
		def user_params
		  params.require(:user).permit(:aclx_id, :id_issued, :forum_name, :full_name, :email, :vehicle_desc, :date_joined, :has_facebook, :comments, :last_activity, :is_leadership)
		end
end