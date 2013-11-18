class Carousel < Hashie::Dash
  #general properties
  property :name
  property :lazy_load_resource
  property :tiles

  def lazy_load?
    !lazy_load_resource.nil?
  end

  def has_tiles?
    tiles.present?
  end
end