class MapElementIndex
  def perform
    %w[foo bar sas].map.with_index {|element, index| "#{index}:#{element}" }
  end
end
