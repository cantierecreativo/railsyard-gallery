module Railsyard::Gallery
  module ActiveRecordExtension

    def has_image(name)
      has_one name,
        as: :imageable,
        class_name: "Railsyard::Gallery::Image",
        conditions: { imageable_relation: name }

      define_method "#{name}=" do |image|
        super(image)
        image.imageable_relation = name
      end
    end

    def has_image_gallery(name)
      has_many name,
        as: :imageable,
        class_name: "Railsyard::Gallery::Image",
        conditions: { imageable_relation: name }

      define_method "#{name}=" do |images|
        super(images)
        images.each do |image|
          image.imageable_relation = name
        end
      end
    end

  end
end
