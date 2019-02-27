class School < ApplicationRecord
  has_many :courses, dependent: :restrict_with_error
  has_many :domains, dependent: :destroy
  has_many :faculty, dependent: :destroy
  has_many :school_strings, dependent: :destroy

  has_one_attached :logo
  has_one_attached :icon

  def logo_variant(variant)
    case variant
      when :mid
        logo.variant(combine_options:
          {
            auto_orient: true,
            gravity: "center",
            resize: '200x200>'
          })
      when :thumb
        logo.variant(combine_options:
          {
            auto_orient: true,
            gravity: "center",
            resize: '100x100>'
          })
      else
        logo
    end
  end

  def icon_variant(variant)
    case variant
      when :thumb
        icon.variant(combine_options:
          {
            auto_orient: true,
            gravity: "center",
            resize: '100x100>'
          })
      else
        icon
    end
  end
end
