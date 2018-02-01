class HomeController < ApplicationController
	def index
		render layout: 'post'
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
	  redirect_to '/home/abstract_success'
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
	  redirect_to '/home/manuscript_success'
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
