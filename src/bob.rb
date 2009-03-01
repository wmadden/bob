#!/usr/bin/ruby
################################################################################
# bob.rb
# 
# The executable version of Bob. Takes as its arguments the files to parse,
# otherwise reads from standard input. Outputs the rendered XHTML.
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
# Foobar.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

require File.join(File.dirname(__FILE__), 'lib/Bob.rb')

# Specify library directory here
libdir = '/usr/lib/bob/rails:/usr/lib/bob'

envpath = ENV['BOB_PATH']
if envpath and Bob::path
  envpath += ":"
end

Bob::path = "#{envpath.to_s}#{Bob::path}:#{libdir}"

$stderr.print "Using path #{Bob::path}\n"

if ARGV.length == 0
  puts Bob.parse( YAML::load($stdin) )
else
  for arg in ARGV do
    components = Bob::parse( YAML::load_file(arg) )
  
    puts components
  end
end
