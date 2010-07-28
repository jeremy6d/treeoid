require 'helper'

class TestTreeoid < Test::Unit::TestCase
  class Node
    include Mongoid::Document
    include Treeoid
    
    field :title, :type => String
  end
  
  context "A treeoid hierarchy" do
    setup do
      @node_one   = Node.create :title => "one"
      @node_two   = Node.create :parent => @node_one, :title => "two"
      @node_three = Node.create :title => "three"
      @node_four  = Node.create :parent => @node_two, :title => "four"
      @node_five  = Node.create :parent => @node_one, :title => "five"
      assert_equal 5, Node.count
    end
    
    should "be able to access all root nodes" do
      Node.root.size.should == 2
      Node.root.should include(@node_three, @node_one)
    end

    should "be able to add a child node" do
      @new_node = Node.create :title => "blah"
      @new_node.children << @node_one
      @new_node.save
      @new_node.children.should include(@node_one)
    end

    should "be able to assign a parent" do
      @node_one.parent = @node_three
      @node_one.save
      @node_one.parent.should == @node_three
    end

    should "not allow a node to be its own parent" do
      @node_one.parent = @node_one
      @node_one.should_not be_valid
      @node_one.errors[:parent_id].should include("cannot be itself")
    end
    
    should "not allow a node's parent to be set to a current child" do
      @node_one.parent = @node_four
      @node_one.should_not be_valid
      @node_one.errors[:parent_id].should include("cannot be a current child")
    end
    
    should "recalculate the paths of all children when path is set" do
      @node_one.parent = @node_three
      @node_one.save
      @node_one.children.each do |child|
        child.ancestry.first.should == @node_three.id
      end
    end
    
    should "correctly set a root node's path correctly" do
      @node_one.ancestry.should == [@node_one.id]
    end
    
    should "correctly set a child node's path" do
      @node_four.ancestry.should == [@node_one, @node_two, @node_four].map { |p| p.id }
    end
    
    should "return in hierarchical order" do
      Node.hierarchically.to_a.should == [@node_one, @node_two, @node_four, @node_five, @node_three]
    end
  end
end
