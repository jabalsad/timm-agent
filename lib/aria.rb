module Aria
  def aria
    @aria ||= Aria2::Downloader.new
  end
end
