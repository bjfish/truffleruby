# Copyright (c) 2017 Oracle and/or its affiliates. All rights reserved. This
# code is released under a tri EPL/GPL/LGPL license. You can use it,
# redistribute it and/or modify it under the terms of the:
#
# Eclipse Public License version 1.0
# GNU General Public License version 2
# GNU Lesser General Public License version 2.1

# Ensure the proxy mechanism has created the module.
java.lang.Iterable

module ::Java::JavaLang::Iterable
  include Enumerable

  def each
    iterator = self.iterator
    while iterator.has_next
      yield iterator.next
    end
  end

  def each_with_index
    i = 0
    iterator = self.iterator
    while iterator.has_next
      yield iterator.next, i
      i += 1
    end
  end
end
