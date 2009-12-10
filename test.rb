require 'annotations'

class Test
  extend Annotations

  _foo
  def baz
    "baz"
  end

  _foo _bar
  def wurble
    "foo"
  end

end

puts Test.annotations.inspect
