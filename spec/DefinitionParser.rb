################################################################################
# DefinitionParser.rb
#
# Unit tests for DefinitionParser.
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

require '../src/DefinitionParser.rb'

include Bob


#
# Imporant functions:
#   * parse_name
#   * get_ancestors
#   * parse_defaults
#   * parse
#   * load
#
describe DefinitionParser do
  it "should be able to get the parent from the name"
  it "should be able to parse the name"
  it "should be able to get ancestors when there are some"
  it "should be able to parse default parameters"
  it "should be able to parse default children"
  it "should be able to parse default decorators"
  it "should be able to parse component template"
  it "should be able to parse definitions"
  it "should be able to load definitions"
end
