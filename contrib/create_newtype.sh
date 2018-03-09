#!/usr/bin/env ruby

newtype = ARGV[0]
wrapped_type = ARGV[1]

text = <<-TXT
module #{newtype} exposing (#{newtype}, from#{wrapped_type}, to#{wrapped_type}, map, map2)
type #{newtype} = #{newtype} #{wrapped_type}
from#{wrapped_type} : #{wrapped_type} -> #{newtype}
from#{wrapped_type} x =
  #{newtype} x
to#{wrapped_type} : #{newtype} -> #{wrapped_type}
to#{wrapped_type} (#{newtype} x) =
  x
map : (#{wrapped_type} -> #{wrapped_type}) -> #{newtype} -> #{newtype}
map f (#{newtype} x) =
  #{newtype} (f x)
map2 : (#{wrapped_type} -> #{wrapped_type} -> #{wrapped_type}) -> #{newtype} -> #{newtype} -> #{newtype}
map2 f (#{newtype} x) (#{newtype} y) =
  #{newtype} (f x y)
TXT

puts text
