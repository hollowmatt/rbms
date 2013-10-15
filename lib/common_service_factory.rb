module CommonServiceFactory
  def default_data_mapper
    data_mapper_class_name = "DataMappers::#{self.name}DataMapper".safe_constantize
    return data_mapper_class_name.new unless data_mapper_class_name.nil?
  end
end