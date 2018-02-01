Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

	%w[index
	conference_venue
	highlight_seoul
	scientific_program
	guidelines
	invited_speaker
	social_program
	organizing_committees
	online_registration
	abstract_preparation
	accommodation
	how_to_reach
	award_general
	award_melvin
	award_dietrich
	award_britton
	award_duane
	manuscript
	imprint
	abstract_success
	manuscript_sucess].each do |a|
		get a.to_s, to: "home##{a}"
	end
	['abstract',
	'manuscript_process'].each do |a|
		post a.to_s, to: "home##{a}"
	end
end
