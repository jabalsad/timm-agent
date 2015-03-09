class Queue
  extend Aria

  def self.all_downloads
    downloads = aria.get_waiting + aria.get_active + aria.get_stopped
    downloads.map {|d| Download.from_aria(d) }
  end
end
