
module Ect

  VERSION = '1.0.0'
end

module Enumerable

  alias bisect partition

  def dissect

    inject([]) { |a, elt| (a[yield(elt)] ||= []) << elt; a }
  end
end

