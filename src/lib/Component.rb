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

class Component

  attr_accessor :kind, :children, :template, :decorators, :params
  
  NameRegexp = /[A-Z][a-z_]*/
  
  #
  # Constructor.
  #
  def initialize( kind = "Component",
                  params = {},
                  children = [],
                  template = "",
                  decorators = [] )

    # Ensure that these default to acceptable types
    @kind = kind || "Component"
    @children = children || []
    @last_child_index = 0
    @template = template || ""
    @decorators = decorators || []
    @params = params || {}
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
    
    return output
  end
  
  #
  # Renders this component alone.
  #
  def render_self( format = :xhtml )
    begin
      e = ERB.new(@template)
      e.result( binding() )
    rescue Exception
      throw "Error rendering template: #{$!.message}\n#{$!.backtrace}"
    end
  end

  #
  # Renders all children of this component, in order, and returns the resultant
  # string.
  #  
  def render_children( format = :xhtml )
    output = ""
    
    @children.each do |child|
      output += child.render(format).to_s
    end
    
    return output
  end
  
  def child(index)
    @children[index]
  end
  
  def next_child
    @last_child_index += 1
    return child(@last_child_index - 1)
  end
  
  def to_s
    render
  end
  
  #
  # If we try to access a non-existant method within the scope of the Component,
  # (e.g. while rendering the template), try and provide the matching parameter
  # value
  #
  def method_missing(m, *args)
    @params[m.to_s]
  end
end
