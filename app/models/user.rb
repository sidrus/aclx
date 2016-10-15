require 'base64'

class User < ApplicationRecord
	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    user = find_by_aclx_id(row["aclx_id"]) || new
	    user.attributes = row.to_hash

	    if !user.full_name.nil? then
	    	user.save!
	    end
	  end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Roo::Csv.new(file.path)
	  when ".xls" then Roo::Excel.new(file.path)
	  when ".xlsx" then Roo::Excelx.new(file.path)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
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