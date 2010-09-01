module IqRdf
  class BlankNode < Node

    attr_reader :node_id

    def initialize(node_id = nil)
      super
      @node_id = node_id
    end

    def to_turtle(parent_lang = nil)
      
    end

    def to_s(parent_lang = nil)
      "[\n#{(nodes.map{|pred| "#{pred} #{pred.nodes.map{|o| o.to_s(pred.lang || parent_lang)}.join(", ")}"}.join(";\n")).gsub(/^/, "    ")}\n]"
    end

    def build_predicate(*args, &block)
      IqRdf::PredicateNamespace.new(self, IqRdf::Default).build_predicate(*args, &block)
    end

  end
end
