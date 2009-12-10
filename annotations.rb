module Annotations

  def annotations
    @annotations ||= {}
  end

  def method_added(name)
    if @next_annotations
      @next_annotations.each do |ann|
        annotations[ann] = [] unless annotations.has_key?(ann)
        annotations[ann] << name
      end
      @next_annotations = nil
    end
  end

  def method_missing(name, *args)
    if name.to_s =~ /^_(.*)/
      @next_annotations ||= []
      @next_annotations << $1.to_sym
      self
    else
      super(name, *args)
    end
  end

end
