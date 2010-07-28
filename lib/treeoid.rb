module Treeoid
  def self.included(base)
    base.class_eval do
      field :ancestry, :type => Array

      references_many :children, :class_name => base.name, :foreign_key => :parent_id
      referenced_in   :parent,   :class_name => base.name

      validate :hierarchical_integrity
      before_save :set_ancestry!
      after_save :set_child_ancestries!

      scope :root, where(:parent_id => nil)
      
      def has_children?
        !children.empty?
      end

      def has_parent?
        !parent.nil?
      end
      
    protected    
      def hierarchical_integrity
        return unless parent_id
        errors.add(:parent_id, "cannot be itself") if parent_id == self.id
        unless self.class.where(:ancestry => id).id(parent_id).empty?
          errors.add(:parent_id, "cannot be a current child") 
        end
      end

      def set_ancestry!
        new_path = [(parent.try(:ancestry) || parent_id), id].compact.flatten
        write_attribute :ancestry, new_path
        
      end
      
      def set_child_ancestries!
        children.each(&:save)
      end
    end
    
    base.instance_eval do
      def hierarchically
        criteria.asc :ancestry
      end
    end
  end
end