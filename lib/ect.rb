
module Ect

  VERSION = '1.1.0'
end


class Object

  alias inflect tap

  def deflect

    yield(self)
  end
end


module Enumerable

  alias bisect partition

  def dissect

    inject([]) { |a, elt| (a[yield(elt)] ||= []) << elt; a }
  end

  def elect

    find { |elt| r = yield(elt); break r if r }
  end
end

