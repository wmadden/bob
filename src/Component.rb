################################################################################
# Component.rb
#
# Represents a component in an HTML layout.
#
# 23/02/09
# William Madden
# w.a.madden@gmail.com
################################################################################

require 'erb'
require 'ComponentDefinition'

class Component

  attr_accessor :kind, :params, :children, :template, :decorators, :definition

  #
  # Constructor.
  #
  def initialize( definition = ComponentDefinition.Default,
                  params = {},
                  children = [],
                  template = "",
                  decorators = [] )

    @kind = definition.kind
    @children = children
    @template = template
    @decorators = decorators
    @params = params
    @definition = definition
  end
  
  #
  # Renders the component.
  #
  # Takes as parameter the format to render in.
  #
  def render( format = :xhtml )
    # Render the component
    output = render_self(format)
    
    # Decorate the output
    for decorator in decorators
      decorator.decorate(output, format)
    end
  end
  
  #
  # Renders this component alone.
  #
  def render_self( format = :xhtml )
    e = ERB.new(@template)
    e.result( binding() )
  end

  #
  # Renders all children of this component, in order, and returns the resultant
  # string.
  #  
  def render_children( format = :xhtml )
    @children.each do |child|
      output += child.render(format)
    end
    
    return output
  end
  
  #
  # Loads a component given its kind and YAML node value.
  #
  def load(kind, value)
    definition = ComponentDefinition.load(yaml)
    
    case
      when value.is_a?(Hash):
        definition.instantiate(value)

      when value.is_a?(Array):
        definition.instantiate({}, value)

      when value.nil?:
        definition.instantiate()
    end
  end
end

