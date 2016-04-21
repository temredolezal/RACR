class Section < ActiveRecord::Base

  belongs_to :project
  has_many :pages
  has_and_belongs_to_many :editors, :class_name => "AdminUser"

  acts_as_list :scope => :project

  before_validation :add_default_permalink
  after_save :touch_project
  after_destroy :delete_related_pages

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  # use presence_of with length_of to disallow spaces
  validates_uniqueness_of :permalink
  # for unique values by subject use ":scope => :subject_id"

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("sections.position ASC") }
  scope :newest_first, lambda { order("sections.created_at DESC")}

  private

    def add_default_permalink
      if permalink.blank?
        self.permalink = "#{id}-#{name.parameterize}"
      end
    end

    def touch_project
      # touch is similar to:
      # subject.update_attribute(:updated_at, Time.now)
      project.touch
    end

    def delete_related_pages
      self.pages.each do |page|
        # Or perhaps instead of destroy, you would
        # move them to a another page.
        # section.destroy
      end
    end

end
