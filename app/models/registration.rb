class Registration < ApplicationRecord
	def send_email
		require 'gmail'
		gmail = Gmail.connect('isott2018', 'tjdnfeotndmleo')
		gmail.deliver do 
			to "hongs.lee90@gmail.com"
			subject "hihihi"
			text_part do 
				body "text here"
			end
		end
		gmail.logout
	end
end
