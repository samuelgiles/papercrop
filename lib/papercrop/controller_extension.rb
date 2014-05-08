module Papercrop
	module ControllerExtension

		# Creates strong attributes for a croping form
		# Usage: User.first.update_attributes(cropping_params(:avatar))
	  def cropping_params(attachment_name)
	    array = [ :crop_x, :crop_y, :crop_w, :crop_h, :original_w, :original_h, :box_w, :aspect, 
	              :min_size, :max_size, :cropped_geometries]
	    array = array.collect {|a| "#{attachment_name}_#{a}"}
	    params.require(:user).permit(array)
	  end

	end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include Papercrop::ControllerExtension
  end
end