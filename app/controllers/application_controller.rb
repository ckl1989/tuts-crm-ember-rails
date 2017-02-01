class ApplicationController < ActionController::API

  def relationship_params
    associations = {}
    (params[:data][:relationships] || []).each do |key,value|
      associations[key.to_sym] = if value[:data].is_a? Array
        value[:data].map {|data| find_related_objects(data)}
      else
        find_related_objects(value[:data])
      end
    end
  end

  private
    def find_related_objects(data)
      #this will get the type object and make reference to the model
      data[:type].singularize.titlecase.contantize.find(data[:id])
    end

end
