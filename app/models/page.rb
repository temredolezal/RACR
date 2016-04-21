class Page < ActiveRecord::Base

  belongs_to :section
  has_many :page_edits
  has_many :editors, :through => :page_edits, :class_name => "AdminUser"

  acts_as_list :scope => :section

  after_save :touch_section

  CONTENT_TYPES = ['text', 'HTML']

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_inclusion_of :content_type, :in => CONTENT_TYPES,
    :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("pages.position ASC") }
  scope :newest_first, lambda { order("pages.created_at DESC")}

  private

    def touch_section
      section.touch
    end

end


=begin

class Section < ActiveRecord::Base

  belongs_to :page, touch: true
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"

  acts_as_list :scope => :page

  after_save touch: true
  #after_save :touch_page

  CONTENT_TYPES = ['text', 'HTML']

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_inclusion_of :content_type, :in => CONTENT_TYPES,
    :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("sections.position ASC") }
  scope :newest_first, lambda { order("sections.created_at DESC")}

  private

    def touch_page
      #page.touch
    end

end
=end