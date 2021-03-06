################################################################################
# Exceptions.rb
#
# Provides exception definitions.
# -----------------------------------------------------------------------------
# (C) Copyright 2009 William Madden
# 
# This file is part of Bob.
# 
# Bob is free software: you can redistribute it and/or modify it under the terms
# of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# Bob is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along with
# Bob.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

module Bob

  module Exceptions
  
    class DefinitionMalformed < Exception
    end
    
    class RenderError < Exception
    end
    
    class RecursiveDefinition < Exception
    end
    
    #
    # Raised when a component identifier can't be properly parsed.
    #
    class InvalidComponentIdentifier < Exception
    end
    
    #
    # Raised when the definition of a component can't be found.
    #
    class DefinitionUnavailable < Exception
    end
    
  end
  
end
