class HomeController < ApplicationController
	def index
		render layout: 'post'
	end
	def bank_registration
		require 'gmail'
		r = Registration.new
		r.bank_transfer = true
		r.first_name = params[:first_name]
		r.last_name = params[:last_name]
		r.institution = params[:institution]
		r.email = params[:email]
		r.country = params[:country]
		r.presentation_type = params[:presentation_type]
		r.pay_type = params[:pay_type]
		r.address = params[:address]
		r.save



		gmail = Gmail.connect('isott2018', 'tjdnfeotndmleo')
		gmail.deliver do 
			to "isott2018@snu.ac.kr"
			subject "[bank transfer] #{r.first_name} #{r.last_name}'s registration was submmited"
			text_part do 
				body "<b>#{r.first_name} #{r.last_name}'s  registration was submited. Please find out below bank transfer information. </b> First_name: #{r.first_name}<br> Last name: #{r.last_name} <br> Institution: #{r.institution} <br> Country: #{r.country} <br> Presentation_type: #{r.presentation_type}<br> Registration: #{r.pay_type}"
			end
			html_part do 
				body "<b>#{r.first_name} #{r.last_name}'s  registration was submited. Please find out below bank transfer information. </b> First_name: #{r.first_name}<br> Last name: #{r.last_name} <br> Institution: #{r.institution} <br> Country: #{r.country} <br> Presentation_type: #{r.presentation_type}<br> Registration: #{r.pay_type}"
			end
		end
		logger.info(r.last_name)

		gmail.deliver do 
			to r.email
			subject "Your bank transfer registration was submmited"
			text_part do 
				body "<b>Your bank transfer registration was submited. Please find out below bank transfer information. </b> <br>1. Swift code: NACF KRSE XXX<br> 2. Bank name: Nonghyup bank<br> 3. Bank address: 109 dong, Seoul National University, 1 Gwanak-ro, Gwanak-gu, Seoul, Korea<br> 4. Account name: Ryu, Pan Dong<br> 5. Account number: 302-1222-9421-11<br>  <br> First_name: #{r.first_name}<br> Last name: #{r.last_name} <br> Institution: #{r.institution} <br> Country: #{r.country} <br> Presentation_type: #{r.presentation_type}<br> Registration: #{r.pay_type}"
			end
			html_part do 
				body "<b>Your bank transfer registration was submited. Please find out below bank transfer information. </b> <br>1. Swift code: NACF KRSE XXX<br> 2. Bank name: Nonghyup bank<br> 3. Bank address: 109 dong, Seoul National University, 1 Gwanak-ro, Gwanak-gu, Seoul, Korea<br> 4. Account name: Ryu, Pan Dong<br> 5. Account number: 302-1222-9421-11<br>  <br> First_name: #{r.first_name}<br> Last name: #{r.last_name} <br> Institution: #{r.institution} <br> Country: #{r.country} <br> Presentation_type: #{r.presentation_type}<br> Registration: #{r.pay_type}"
			end
		end
		gmail.logout

		redirect_to '/bank_registration_success'
	end
	def paypal_ipn
		r = Registration.new
		r.content = params.to_json
		r.save
		require 'gmail'
		gmail = Gmail.connect('isott2018', 'tjdnfeotndmleo')
		custom = JSON.parse(JSON.parse(Registration.last.content)["custom"])
		gmail.deliver do 
			to custom["email"]
			subject "Your registration was successed"
			text_part do 
				body "Your registration was successed <br>First_name: #{custom["first_name"]}<br>Last name: #{custom["last_name"]} <br>Institution: #{custom["institution"]} <br>Country: #{custom["country"]} <br>Presentation_type: #{custom["presentation_type"]}<br> Registration: #{custom["pay_type"]}"
			end
			html_part do 
				body "Your registration was successed <br>First_name: #{custom["first_name"]}<br>Last name: #{custom["last_name"]} <br>Institution: #{custom["institution"]} <br>Country: #{custom["country"]} <br>Presentation_type: #{custom["presentation_type"]}<br> Registration: #{custom["pay_type"]}"
			end
		end
		gmail.deliver do 
			to 'isott2018@snu.ac.kr'
			subject "[Paypal] #{custom["first_name"]} #{custom["last_name"]}'s registration was successed"
			text_part do 
				body "#{custom["first_name"]} #{custom["last_name"]}'s registration was successed <br>First_name: #{custom["first_name"]}<br>Last name: #{custom["last_name"]} <br>Institution: #{custom["institution"]} <br>Country: #{custom["country"]} <br>Presentation_type: #{custom["presentation_type"]}<br> Registration: #{custom["pay_type"]}"
			end
			html_part do 
				body "#{custom["first_name"]} #{custom["last_name"]}'s registration was successed <br>First_name: #{custom["first_name"]}<br>Last name: #{custom["last_name"]} <br>Institution: #{custom["institution"]} <br>Country: #{custom["country"]} <br>Presentation_type: #{custom["presentation_type"]}<br> Registration: #{custom["pay_type"]}"
			end
		end
		gmail.logout
		render json: {}
	end

	def online_registration_sucess
	end
	
	def abstract
	  file = params[:upload]['abstract_file']
	  name = file.original_filename
          first_author_first_name = params[:first_author_first_name]
	  first_author_last_name = params[:first_author_last_name]
	  first_author_email = params[:first_author_email]
	  corresponding_author_first_name = params[:corresponding_author_first_name]
	  corresponding_author_last_name = params[:corresponding_author_last_name]
	  corresponding_author_email = params[:corresponding_author_email]
	  dir = 'public/abstract'
	  file_name = first_author_first_name + '_' + first_author_last_name + '_(' + corresponding_author_first_name + "_" + corresponding_author_last_name + ")_" + name

   	  a = Abstract.new
	  a.first_author_first_name = first_author_first_name
	  a.first_author_last_name = first_author_last_name
 	  a.first_author_email = first_author_email
	  a.corresponding_author_first_name = corresponding_author_first_name
	  a.corresponding_author_last_name = corresponding_author_last_name
	  a.corresponding_author_email = corresponding_author_email
	  a.filename = file_name
	  a.save

	  path = Rails.root.join(dir,file_name)
	  File.open(path, "wb") { |f| f.write(file.read)}

		require 'gmail'
		gmail = Gmail.connect('isott2018', 'tjdnfeotndmleo')
		gmail.deliver do 
			to "isott2018@snu.ac.kr"
			subject "Abstract of #{first_author_first_name} #{first_author_last_name} submitted"
			text_part do 
				body "http://isott2018.com/abstract/#{file_name}"
			end
			html_part do 
				body "<a href='http://isott2018.com/abstract/#{file_name}'> Download abstract"
			end
		end

		gmail.deliver do 
			to [first_author_email, corresponding_author_email]
			subject "Abstract of #{first_author_first_name} #{first_author_last_name} submitted"
			text_part do 
				body "Your abstract was successfully submitted. <br> first_author: #{first_author_first_name + " " + first_author_last_name} <br> corresponding_author : #{corresponding_author_first_name + " " + corresponding_author_last_name} <br> check the uploaded abstract : http://isott2018.com/abstract/#{file_name}"
			end
			html_part do 
				body "Your abstract was successfully submitted. <br> first_author: #{first_author_first_name + " " + first_author_last_name} <br> corresponding_author : #{corresponding_author_first_name + " " + corresponding_author_last_name} <br> check the uploaded abstract : <a href='http://isott2018.com/abstract/#{file_name}'> Check abstract </a>"
			end
		end


		gmail.logout

	  redirect_to '/abstract_success'
	end
	def abstract_success
		render layout: 'post'
	end

	def manuscript_process
	  file = params[:upload]['file']
	  name = file.original_filename
          first_author_first_name = params[:first_author_first_name]
	  first_author_last_name = params[:first_author_last_name]
	  first_author_email = params[:first_author_email]
	  corresponding_author_first_name = params[:corresponding_author_first_name]
	  corresponding_author_last_name = params[:corresponding_author_last_name]
	  corresponding_author_email = params[:corresponding_author_email]
	  dir = 'public/manuscript'
	  file_name = first_author_first_name + '_' + first_author_last_name + '_(' + corresponding_author_first_name + "_" + corresponding_author_last_name + ")_" + name

   	  a = Manuscript.new
	  a.first_author_first_name = first_author_first_name
	  a.first_author_last_name = first_author_last_name
 	  a.first_author_email = first_author_email
	  a.corresponding_author_first_name = corresponding_author_first_name
	  a.corresponding_author_last_name = corresponding_author_last_name
	  a.corresponding_author_email = corresponding_author_email
	  a.filename = file_name
	  a.save

	  path = Rails.root.join(dir,file_name)
	  File.open(path, "wb") { |f| f.write(file.read)}



		require 'gmail'
		gmail = Gmail.connect('isott2018', 'tjdnfeotndmleo')
		gmail.deliver do 
			to "isott2018@snu.ac.kr"
			subject "Manuscript of #{first_author_first_name} #{first_author_last_name} submitted"
			text_part do 
				body "http://isott2018.com/manuscript/#{file_name}"
			end
			html_part do 
				body "<a href='http://isott2018.com/abstract/#{file_name}'> Download manuscript"
			end
		end

		gmail.deliver do 
			to [first_author_email, corresponding_author_email]
			subject "Manuscript of #{first_author_first_name} #{first_author_last_name} submitted"
			text_part do 
				body "Your manuscript was successfully submitted. <br> first_author: #{first_author_first_name + " " + first_author_last_name} <br> corresponding_author : #{corresponding_author_first_name + " " + corresponding_author_last_name} <br> check the uploaded manuscript : http://isott2018.com/manuscript/#{file_name}"
			end
			html_part do 
				body "Your manuscript was successfully submitted. <br> first_author: #{first_author_first_name + " " + first_author_last_name} <br> corresponding_author : #{corresponding_author_first_name + " " + corresponding_author_last_name} <br> check the uploaded manuscript : <a href='http://isott2018.com/manuscript/#{file_name}'> Check manuscript </a>"
			end
		end


		gmail.logout

	  redirect_to '/manuscript_success'
	end
	def manuscript_success
		render layout: 'post'
	end

	
	def conference_venue
		render layout: 'post'
	end

	def highlight_seoul
		render layout: 'post'
	end


	def scientific_program
		render layout: 'post'
	end

	def guidelines
		render layout: 'post'
	end

	def invited_speaker
		render layout: 'post'
	end

	def social_program
		render layout: 'post'
	end

	def organizing_committees
		render layout: 'post'
	end


	def online_registration
		render layout: 'post'
	end
	def online_registration_success
		render layout: 'post'
	end

	def abstract_preparation
		render layout: 'post'
	end


	def accommodation
		render layout: 'post'
	end

	def how_to_reach
		render layout: 'post'
	end


	def award_general
		render layout: 'post'
	end

	def award_melvin
		render layout: 'post'
	end

	def award_dietrich
		render layout: 'post'
	end

	def award_britton
		render layout: 'post'
	end

	def award_duane
		render layout: 'post'
	end


	def manuscript
		render layout: 'post'
	end

end
